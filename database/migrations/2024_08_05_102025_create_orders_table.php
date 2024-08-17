<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('orders', function (Blueprint $table) {
            $table->id();

            $table->text('order_number');
            $table->text('description')->default(null);
            $table->text('word_count')->default(null);
            $table->string('deadline')->default(null);
            $table->json('order_attachments')->default(null);
            $table->text('comment')->default(null);

            $table->string('name');
            $table->string('email')->default(null);
            $table->string('phone_number')->default(null);
            $table->unsignedBigInteger('status')->comment('1: In progress, 2: Revision, 3: Completed, 4: Cancelled');

            $table->unsignedBigInteger('payment_method')->comment('1: Paypal , 2: Payooner , "Other');
            $table->json('payment_receipt')->default(null);

            $table->text('total_amount');
            $table->text('upfront');
            $table->boolean('priority')->default(0)->comment("0 = No, 1 = Yes");


            $table->unsignedBigInteger('user_id')->default(null);
            $table->unsignedBigInteger('lead_id');
            $table->unsignedBigInteger('order_categories_id');




            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
            $table->foreign('lead_id')->references('id')->on('leads')->onDelete('cascade');
            $table->foreign('order_categories_id')->references('id')->on('order_categories')->onDelete('cascade');


            $table->timestamps();


        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('orders');
    }
};
