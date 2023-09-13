<?php
namespace Modules\ChatGpt\Listeners;

use App\Events\Menu\AdminCreated as Event;

class AddToAdminMenu
{
    public function handle(Event $event): void
    {
        $title = trans('chat-gpt::general.name');

        // Add child to existing menu item
        // $item = $event->menu->whereTitle(trans_choice('general.reports', 2));
        // $item->route('chat-gpt.main.index', $title, [], 4, ['icon' => 'contact_support']);

        // Add new menu item
        $event->menu->add([
            'route' => ['chat-gpt.main.index', []],
            'title' => $title,
            'icon' => 'sms',
            'order' => 120,
        ]);
    }
}