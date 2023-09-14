<?php

namespace Modules\ChatGpt\Jobs;

use App\Abstracts\Job;
use App\Interfaces\Job\HasOwner;
use App\Interfaces\Job\HasSource;
use App\Interfaces\Job\ShouldCreate;
use Modules\ChatGpt\Models\Chat;

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
            $inputs = [
                "company_id" => company_id(),
                "title" => "New chat",
                "parent_id" => $this->request->input("parent_id", 0),
                "content" => $this->request->input("content"),
                "type" => 0,
            ];
            $this->model = Chat::create($inputs);

            // Upload picture
            // if ($this->request->file('picture')) {
            //     $media = $this->getMedia($this->request->file('picture'), 'items');

            //     $this->model->attachMedia($media, 'picture');
            // }

        });

        return $this->model;
    }
}
