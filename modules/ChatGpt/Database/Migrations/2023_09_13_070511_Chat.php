<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class Chat extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        //
        Schema::create('chats', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('company_id');
            $table->string('title')->nullable();
            $table->integer('parent_id')->default(0);
            $table->text('content')->nullable();
            $table->tinyInteger('type')->default(0)->comment("0: send out; 1: receive from chatgpt");
            $table->timestamps();
            $table->softDeletes();

            $table->index('company_id');
            $table->index('parent_id');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        //
    }
}
