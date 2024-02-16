<?php

namespace Modules\ChatGpt\Jobs;

use App\Abstracts\Job;
use App\Interfaces\Job\HasOwner;
use App\Interfaces\Job\HasSource;
use App\Interfaces\Job\ShouldCreate;
use Modules\ChatGpt\Models\Chat;
use OpenAI\Laravel\Facades\OpenAI;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Str;

use function PHPUnit\Framework\isEmpty;

class CallGpt extends Job implements HasOwner, HasSource, ShouldCreate
{
    protected $chat;

    // public function __construct($chat)
    // {
    //     $this->chat = $chat;
    // }

    /**
     * Execute the job.
     *
     * @return void
     */
    public function handle()
    {
        $parent_id = $this->request->input("parent_id", 0);
        $content = $this->request->input("content");
        $data = [
            "company_id" => company_id(),
            "title" => $parent_id > 0 ? '' : Str::substr($content, 0, 20),
            "parent_id" => $parent_id,
            "content" => $content,
            "type" => 0,
        ];
        $newChat = Chat::create($data);

        $new_chat = $parent_id == 0;
        if ($new_chat) {
            $parent_id = $newChat->id;
            $parent = $newChat;
        } else {
            $parent = null;
        }

        $res_content = "";
        if (Str::of($content)->startsWith('/db ')) {
            # response from langchain
            $api_host = "http://192.168.86.119:8000";
//            $api_host = "https://s.pocketcfos.com";
            $response = Http::asForm()->timeout(300)->post($api_host . '/db-chat', [
                'message' => $content
            ]);
            if ($response->ok()) {
                $res_content = $response['data'];
            } else {
                $res_content = "Nothing from the Database, Please try another question.";
            }
        } else {
            // response from openai chat completion
            $history_msg = [];
            $history_msg[] = ['role' => 'system',
                "content" => "Pretending you’re an accountant.
                You know everything about financial, accounting or tax,
                such as balance sheets, ledger, credit, debit, etc.
                You can only answer user's question related greeting, financial, accounting or tax,
                if user's question is not relevant then reply 'It's not financial related.'
                "];
            // When you see "/db" starts in previous history,
            // it means the following message comes from database.
            if ($new_chat) {
                $history_msg[] = ['role' => 'user', 'content' => $content];
            } else {
                // get chat history
                $history = Chat::where('parent_id', $parent_id)->orWhere('id', $parent_id)
                    ->orderBy('created_at', 'asc')->collect();
                foreach ($history as $msg) {
                    $history_msg[] = ['role' => $msg->type > 0 ? 'assistant' : 'user', 'content' => $msg->content];
                }
            }
            $result = OpenAI::chat()->create([
                'model' => 'gpt-3.5-turbo-0613',
                'messages' => $history_msg,
            ]);
            $res_content = $result['choices'][0]['message']['content'];
        }

        $data = [
            "company_id" => company_id(),
            "title" => 'ChatGpt Res',
            "parent_id" => $parent_id,
            "content" => trim(trim($res_content), '"'),
            "type" => 1,
        ];

        $this->model = Chat::create($data);
        $this->model->parent = $parent;
        return $this->model;
    }
    /**
     * Execute the job.
     *
     * @return void
     */
    public function handle_b()
    {
        $new_chat = !$this->chat->parent_id > 0;
        $parent_id = $new_chat ? $this->chat->id : $this->chat->parent_id;

        $history_msg = [];
        $history_msg[] = ['role' => 'system', 'content' => 'Pretending you’re an accountant. You know everything about balance sheets, ledger, credit, debit, etc.'];
        if ($new_chat) {
            $history_msg[] = ['role' => 'user', 'content' => $this->chat->content];
        } else {
            // get chat history
            $history = Chat::where('parent_id', $parent_id)->orWhere('id', $parent_id)
                ->orderBy('created_at', 'asc')->collect();
            foreach ($history as $msg) {
                $history_msg[] = ['role' => $msg->type > 0 ? 'assistant' : 'user', 'content' => $msg->content];
            }
        }

        // gpt-3.5-turbo
        \DB::transaction(function () use ($history_msg, $parent_id) {
            $result = OpenAI::chat()->create([
                'model' => 'gpt-3.5-turbo-0613',
                'messages' => $history_msg,
            ]);

            $data = [
                "company_id" => company_id(),
                "title" => 'ChatGpt Res',
                "parent_id" => $parent_id,
                // "content" => json_encode($result['choices']),
                "content" => json_encode($result['choices'][0]['message']['content']),
                "type" => 1,
            ];
            $this->model = Chat::create($data);
        });

        return $this->model;
    }
}
