<?php

namespace Modules\ChatGpt\Jobs;

use App\Abstracts\Job;
use App\Interfaces\Job\HasOwner;
use App\Interfaces\Job\HasSource;
use App\Interfaces\Job\ShouldCreate;
use Modules\ChatGpt\Models\Chat;
use Illuminate\Support\Str;

class CreateChat extends Job implements HasOwner, HasSource, ShouldCreate
{
    /**
     * Execute the job.
     *
     * @return void
     */
    public function handle(): Chat
    {
        \DB::transaction(function () {
            $parent_id = $this->request->input("parent_id", 0);
            $content = $this->request->input("content");
            $data = [
                "company_id" => company_id(),
                "title" => $parent_id > 0 ? '' : Str::substr($content, 0, 20),
                "parent_id" => $parent_id,
                "content" => $content,
                "type" => 0,
            ];
            $this->model = Chat::create($data);

            // Upload picture
            // if ($this->request->file('picture')) {
            //     $media = $this->getMedia($this->request->file('picture'), 'items');

            //     $this->model->attachMedia($media, 'picture');
            // }

        });

        return $this->model;
    }
}
