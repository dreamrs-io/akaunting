<?php

namespace Modules\ChatGpt\Jobs;

use App\Abstracts\Job;
use App\Interfaces\Job\HasOwner;
use App\Interfaces\Job\HasSource;
use App\Interfaces\Job\ShouldCreate;
use Modules\ChatGpt\Models\Chat;
use OpenAI\Laravel\Facades\OpenAI;

class CallGpt extends Job implements HasOwner, HasSource, ShouldCreate
{
    protected $chat;

    public function __construct($chat)
    {
        $this->chat = $chat;
    }
    /**
     * Execute the job.
     *
     * @return void
     */
    public function handle()
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
            foreach($history as $msg) {
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
