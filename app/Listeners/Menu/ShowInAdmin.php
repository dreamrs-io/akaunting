<?php

namespace App\Listeners\Menu;

use App\Traits\Permissions;
use App\Events\Menu\AdminCreated as Event;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Str;

class ShowInAdmin
{
    use Permissions;

    /**
     * Handle the event.
     *
     * @param  $event
     * @return void
     */
    public function handle(Event $event)
    {
        $menu = $event->menu;

        $attr = ['icon' => ''];

        // Dashboards
        $title = trim(trans_choice('general.dashboards', 1));
        if ($this->canAccessMenuItem($title, 'read-common-dashboards')) {
            $inactive = ('dashboard' != Route::currentRouteName()) ? true : false;
            $menu->route('dashboard', $title, [], 10, ['icon' => 'speed', 'inactive' => $inactive]);
        }

        // Items
        $title = trim(trans_choice('general.items', 2));
        if ($this->canAccessMenuItem($title, 'read-common-items')) {
            $menu->route('items.index', $title, [], 20, ['icon' => 'inventory_2']);
        }

        // Sales
        $title = trim(trans_choice('general.sales', 2));
        if ($this->canAccessMenuItem($title, ['read-sales-invoices', 'read-sales-customers'])) {
            $menu->dropdown($title, function ($sub) use ($attr) {
                $title = trim(trans_choice('general.invoices', 2));
                if ($this->canAccessMenuItem($title, 'read-sales-invoices')) {
                    $sub->route('invoices.index', $title, [], 10, $attr);
                }

                $title = trim(trans_choice('general.customers', 2));
                if ($this->canAccessMenuItem($title, 'read-sales-customers')) {
                    $sub->route('customers.index', $title, [], 20, $attr);
                }
            }, 30, [
                'title' => $title,
                'icon' => 'payments',
            ]);
        }

        // Purchases
        $title = trim(trans_choice('general.purchases', 2));
        if ($this->canAccessMenuItem($title, ['read-purchases-bills', 'read-purchases-vendors'])) {
            $menu->dropdown($title, function ($sub) use ($attr) {
                $title = trim(trans_choice('general.bills', 2));
                if ($this->canAccessMenuItem($title, 'read-purchases-bills')) {
                    $sub->route('bills.index', $title, [], 10, $attr);
                }

                $title = trim(trans_choice('general.vendors', 2));
                if ($this->canAccessMenuItem($title, 'read-purchases-vendors')) {
                    $sub->route('vendors.index', $title, [], 20, $attr);
                }
            }, 40, [
                'title' => $title,
                'icon' => 'shopping_cart',
            ]);
        }

        // Banking
        $title = trim(trans('general.banking'));
        if ($this->canAccessMenuItem($title, ['read-banking-accounts', 'read-banking-transfers', 'read-banking-transactions', 'read-banking-reconciliations'])) {
            $menu->dropdown($title, function ($sub) use ($attr) {
                $title = trim(trans_choice('general.accounts', 2));
                if ($this->canAccessMenuItem($title, 'read-banking-accounts')) {
                    $sub->route('accounts.index', $title, [], 10, $attr);
                }

                $title = trim(trans_choice('general.transactions', 2));
                if ($this->canAccessMenuItem($title, 'read-banking-transactions')) {
                    $sub->route('transactions.index', $title, [], 20, $attr);
                }

                $title = trim(trans_choice('general.transfers', 2));
                if ($this->canAccessMenuItem($title, 'read-banking-transfers')) {
                    $sub->route('transfers.index', $title, [], 30, $attr);
                }

                $title = trim(trans_choice('general.reconciliations', 2));
                if ($this->canAccessMenuItem($title, 'read-banking-reconciliations')) {
                    $sub->route('reconciliations.index', $title, [], 40, $attr);
                }
            }, 50, [
                'title' => $title,
                'icon' => 'account_balance',
            ]);
        }

        // Reports
        $title = trim(trans_choice('general.reports', 2));
        if ($this->canAccessMenuItem($title, 'read-common-reports')) {
            $menu->route('reports.index', $title, [], 60, ['icon' => 'donut_small']);
        }

        // Apps
        // $title = trim(trans_choice('general.modules', 2));
        // if ($this->canAccessMenuItem($title, 'read-modules-home')) {
        //     $active = (Str::contains(Route::currentRouteName(), 'apps')) ? true : false;
        //     $menu->route('apps.home.index', $title, [], 80, ['icon' => 'rocket_launch', 'active' => $active]);
        // }

        // TODO: move to modules
        // Taxes
        $title = trim('Taxes');
        $active = (Str::contains(Route::currentRouteName(), 'apps')) ? true : false;
        $menu->route('apps.home.index', $title, [], 80, ['icon' => 'percent', 'active' => $active]);

        // Documents
        $title = trim('Documents');
        $active = (Str::contains(Route::currentRouteName(), 'apps')) ? true : false;
        $menu->route('apps.home.index', $title, [], 80, ['icon' => 'description', 'active' => $active]);

        // TODO: move Setting to main menu
        // Setting
        // $title = trim(trans_choice('general.settings', 2));
        // $menu->dropdown($title, function ($sub) use ($attr) {
        //     $title = trim(trans_choice('general.companies', 1));
        //     if ($this->canAccessMenuItem($title, 'read-settings-company')) {
        //         $sub->route('settings.company.edit', $title, [], 10, ['icon' => 'business', 'search_keywords' => trans('settings.company.search_keywords')]);
        //     }

        //     $title = trim(trans_choice('general.localisations', 1));
        //     if ($this->canAccessMenuItem($title, 'read-settings-localisation')) {
        //         $sub->route('settings.localisation.edit', $title, [], 20, ['icon' => 'flag', 'search_keywords' => trans('settings.localisation.search_keywords')]);
        //     }

        //     $title = trim(trans_choice('general.invoices', 1));
        //     if ($this->canAccessMenuItem($title, 'read-settings-invoice')) {
        //         $sub->route('settings.invoice.edit', $title, [], 30, ['icon' => 'description', 'search_keywords' => trans('settings.invoice.search_keywords')]);
        //     }

        //     $title = trim(trans_choice('general.defaults', 1));
        //     if ($this->canAccessMenuItem($title, 'read-settings-defaults')) {
        //         $sub->route('settings.default.edit', $title, [], 40, ['icon' => 'tune', 'search_keywords' => trans('settings.default.search_keywords')]);
        //     }

        //     $title = trim(trans_choice('general.email_services', 1));
        //     if ($this->canAccessMenuItem($title, 'read-settings-email')) {
        //         $sub->route('settings.email.edit', $title, [], 50, ['icon' => 'email', 'search_keywords' => trans('settings.email_services.search_keywords')]);
        //     }

        //     $title = trim(trans_choice('general.email_templates', 2));
        //     if ($this->canAccessMenuItem($title, 'read-settings-email-templates')) {
        //         $sub->route('settings.email-templates.edit', $title, [], 60, ['icon' => 'attach_email', 'search_keywords' => trans('settings.email.templates.search_keywords')]);
        //     }

        //     $title = trim(trans('settings.scheduling.name'));
        //     if ($this->canAccessMenuItem($title, 'read-settings-schedule')) {
        //         $sub->route('settings.schedule.edit', $title, [], 70, ['icon' => 'alarm', 'search_keywords' => trans('settings.scheduling.search_keywords')]);
        //     }

        //     $title = trim(trans_choice('general.categories', 2));
        //     if ($this->canAccessMenuItem($title, 'read-settings-categories')) {
        //         $sub->route('categories.index', $title, [], 80, ['icon' => 'folder', 'search_keywords' => trans('settings.categories.search_keywords')]);
        //     }

        //     $title = trim(trans_choice('general.currencies', 2));
        //     if ($this->canAccessMenuItem($title, 'read-settings-currencies')) {
        //         $sub->route('currencies.index', $title, [], 90, ['icon' => 'attach_money', 'search_keywords' => trans('settings.currencies.search_keywords')]);
        //     }

        //     $title = trim(trans_choice('general.taxes', 2));
        //     if ($this->canAccessMenuItem($title, 'read-settings-taxes')) {
        //         $sub->route('taxes.index', $title, [], 100, ['icon' => 'percent', 'search_keywords' => trans('settings.taxes.search_keywords')]);
        //     }

        // }, 100, [
        //     'title' => $title,
        //     'icon' => 'settings',
        // ]);
    }
}
