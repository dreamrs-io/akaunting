<?php

namespace Modules\ChatGpt\Http\Controllers;

use App\Abstracts\Http\Controller;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Traits\Users;
use Modules\ChatGpt\Jobs\CreateChat;
use Modules\ChatGpt\Jobs\CallGpt;
use Modules\ChatGpt\Models\Chat;

class Main extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return Response
     */
    public function index()
    {    
        // ALL the 'chats' on chat Server are based on userId we will encrpt that and pass it to view
        $userId= encrypt(user()->id);
        $userEmail= user()->email;
        //Expiration time can be added within this encrypted text which ensures even if the text is hacked its useless afeter some time 
        return $this->response('chat-gpt::index',compact('userId','userEmail'));
    }

    // All the below function will be performed By chat-server

    // public function getList()
    // {
    //     $chatList = Chat::where('parent_id', 0)->orderBy('created_at', 'desc')->collect();
    //     $response['data'] = $chatList;
    //     $response['success'] = true;
    //     flash("Ok!")->success();
    //     return response()->json($response);
    // }

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

    // public function detail($id) {
    //     $chat = Chat::find($id);
    //     if ($chat) {
    //         $chat_history = Chat::where('parent_id', $chat->id)->orderBy('created_at', 'asc')->collect();
    //         $response['data'] = [
    //             'chat' => $chat,
    //             'chat_history' => $chat_history,
    //         ];
    //         $response['success'] = true;
    //         flash("Ok!")->success();
    //     } else {
    //         $response['data'] = [];
    //         $response['success'] = false;
    //         flash("Chat not found!")->success();
    //     }
    //     return response()->json($response);
    // }

    // public function send(Request $request) {
    //     $response = $this->ajaxDispatch(new CreateChat($request));

    //     if ($response['success']) {
    //         // $response['redirect'] = route('items.index');

    //         // $message = trans('messages.success.added', ['type' => trans_choice('general.items', 1)]);
    //         $message = "Message sent!!";

    //         flash($message)->success();
    //     } else {
    //         // $response['redirect'] = route('items.create');

    //         $message = $response['message'];

    //         flash($message)->error()->important();
    //     }

    //     return response()->json($response);
    // }

    // public function callGpt(Request $request) {
    //     $chat = Chat::find($request->input('id'));

    //     if ($chat) {
    //         $response = $this->ajaxDispatch(new CallGpt($chat));
    //         if ($response['success']) {
    //             $message = "Message sent!!";
    //             flash($message)->success();
    //         } else {
    //             $message = $response['message'];
    //             flash($message)->error()->important();
    //         }
    //     } else {
    //         $response = [
    //             'success' => false,
    //             'error' => true,
    //             'data' => null,
    //             'message' => 'data not found!',
    //         ];
    //     }
    //     return response()->json($response);
    // }
}
