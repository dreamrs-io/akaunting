<?php

namespace Modules\ChatGpt\Http\Controllers;

use App\Abstracts\Http\Controller;
use App\Providers\Route;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Session;
use App\Traits\Users;
use Illuminate\Support\Str;
use Modules\ChatGpt\Jobs\CreateChat;
use Modules\ChatGpt\Jobs\CallGpt;
use Modules\ChatGpt\Models\Chat;
use Illuminate\Support\Facades\Validator;
use OpenAI\Laravel\Facades\OpenAI;

class Main extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return Response
     */
    public function index(Request $request)
    {
        // ALL the 'chats' on chat Server are based on userId we will encrpt that and pass it to view
        // getiing Id, Email and Password and Base64Encoding Them and Encryptiong Them
        $userPassword = Session::get('password');
        $basicAuthToken = 'Basic ' . base64_encode(user()->email . ':' . $userPassword);
        $userChatToken = encrypt(json_encode(['id' => user()->id, 'BasicApiAuthToken' => $basicAuthToken]), false);
        $currentUrl =  url()->current();
        // die();
        return $this->response('chat-gpt::index', compact('userChatToken', 'currentUrl'));
    }

    // All the below function will be performed By chat-server

    public function getList()
    {
        $chatList = Chat::where('parent_id', 0)->orderBy('created_at', 'desc')->collect();
        $response['data'] = $chatList;
        $response['success'] = true;
        flash("Ok!")->success();
        return response()->json($response);
    }

    // /**
    //  * Show the form for creating a new resource.
    //  *
    //  * @return Response
    //  */
    // public function create()
    // {
    //     return view('chat-gpt::create');
    // }

    // /**
    //  * Store a newly created resource in storage.
    //  *
    //  * @param Request $request
    //  * @return Response
    //  */
    // public function store(Request $request)
    // {

    // }

    // /**
    //  * Show the specified resource.
    //  *
    //  * @param int $id
    //  * @return Response
    //  */
    // public function show($id)
    // {
    //     return view('chat-gpt::show');
    // }

    // /**
    //  * Show the form for editing the specified resource.
    //  *
    //  * @param int $id
    //  * @return Response
    //  */
    // public function edit($id)
    // {
    //     return view('chat-gpt::edit');
    // }

    // /**
    //  * Update the specified resource in storage.
    //  *
    //  * @param Request $request
    //  * @param int $id
    //  * @return Response
    //  */
    // public function update(Request $request, $id)
    // {
    //     //
    // }

    // /**
    //  * Remove the specified resource from storage.
    //  *
    //  * @param int $id
    //  * @return Response
    //  */
    // public function destroy($id)
    // {
    //     //
    // }

    public function detail($id) {
        $chat = Chat::find($id);
        if ($chat) {
            $chat_history = Chat::where('parent_id', $chat->id)
                    ->orderBy('created_at', 'asc')
                    ->collect()->toArray();
            array_unshift($chat_history, $chat);
            $response['data'] = $chat_history;
            $response['success'] = true;
            flash("Ok!")->success();
        } else {
            $response['data'] = [];
            $response['success'] = false;
            flash("Chat not found!")->success();
        }
        return response()->json($response);
    }

    /**
     * @Deprecated
     */
    public function send(Request $request) {
        $response = $this->ajaxDispatch(new CreateChat($request));

        if ($response['success']) {
            // $response['redirect'] = route('items.index');

            // $message = trans('messages.success.added', ['type' => trans_choice('general.items', 1)]);
            $message = "Message sent!!";

            flash($message)->success();
        } else {
            // $response['redirect'] = route('items.create');

            $message = $response['message'];

            flash($message)->error()->important();
        }

        return response()->json($response);
    }

    public function callGpt(Request $request) {
        // $chat = Chat::find($request->input('id'));

        $response = $this->ajaxDispatch(new CallGpt($request));
        if ($response['success']) {
            $message = "Message sent!!";
            flash($message)->success();
        } else {
            $message = $response['message'];
            flash($message)->error()->important();
        }
        return response()->json($response);
    }

    public function deleteChat(Request $request) {
        $validator = Validator::make($request->all(), [
            'id' => 'required|number',
        ]);

        if ($validator->fails()) {
            $response = [
                'success' => false,
                'error' => true,
                'data' => [],
                'message' => $validator->errors()->first(),
            ];
            return response()->json($response);
        }
        $chat = Chat::query()->find($request->id);
        if ($chat) {
            $chat->forceDelete();
            Chat::query()->where('parent_id', $request->id)->forceDelete();
            $response = [
                'success' => true,
                'error' => false,
                'data' => [],
                'message' => 'Chat deleted!',
            ];
        } else {
            $response = [
                'success' => false,
                'error' => true,
                'data' => [],
                'message' => 'Chat not found!',
            ];
        }
        return response()->json($response);

    }

    public function callGptStreamed(Request $request) {
        $parent_id = $request->input("parent_id", 0);
        $content = $request->input("content");
        $data = [
            "company_id" => company_id(),
            "title" => $parent_id > 0 ? '' : Str::substr($content, 0, 20),
            "parent_id" => $parent_id,
            "content" => $content,
            "type" => 0,
        ];
        $newChat = Chat::query()->create($data);

        $new_chat = $parent_id == 0;
        if ($new_chat) {
            $parent_id = $newChat->id;
            $parent = $newChat;
        } else {
            $parent = null;
        }

        $history_msg = [];
        $history_msg[] = ['role' => 'system', 'content' => 'Pretending you’re an accountant.
        You know everything about balance sheets, ledger, credit, debit, etc. '];
        // When you see "/db" starts in previous history,
        // it means the following message comes from database.
        if ($new_chat) {
            $history_msg[] = ['role' => 'user', 'content' => $content];
        } else {
            // get chat history
            $history = Chat::query()->where('parent_id', $parent_id)->orWhere('id', $parent_id)
                ->orderBy('created_at', 'asc')->collect();
            foreach ($history as $msg) {
                $history_msg[] = ['role' => $msg->type > 0 ? 'assistant' : 'user', 'content' => $msg->content];
            }
        }

        return response()->stream(function () use ($request, $history_msg) {
            $stream = OpenAI::chat()->createStreamed([
                'model' => 'gpt-3.5-turbo-0613',
                'messages' => $history_msg,
            ]);
            foreach ($stream as $response) {
                $text = $response['choices'][0]['message'];
                if (connection_aborted()) {
                    break;
                }

                echo "event: update\n";
                echo 'data: ' . $text;
                echo "\n\n";
                ob_flush();
                flush();
            }

            echo "event: update\n";
            echo 'data: <END_STREAMING_SSE>';
            echo "\n\n";
            ob_flush();
            flush();
        }, 200, [
            'Cache-Control' => 'no-cache',
            'X-Accel-Buffering' => 'no',
            'Content-Type' => 'text/event-stream',
        ]);
    }
}
