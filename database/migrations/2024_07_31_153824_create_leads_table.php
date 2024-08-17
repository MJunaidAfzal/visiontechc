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
        Schema::create('leads', function (Blueprint $table) {
            $table->id();

            $table->string('name');
            $table->string('title')->default(null);
            $table->string('email');
            $table->string('phone_number');
            $table->string('city')->default(null);
            $table->string('country')->default(null);
            $table->longText('description')->default(null);

            $table->unsignedBigInteger('client_id')->default(null);
            $table->unsignedBigInteger('lead_source_id')->default(null);
            // $table->unsignedBigInteger('client_id');
            $table->boolean('status')->default(1)->comment("0 = Open - Contacted, 1 = Open - Uncontacted ");

            $table->foreign('client_id')->references('id')->on('clients')->onDelete('cascade');
            $table->foreign('lead_source_id')->references('id')->on('lead_sources')->onDelete('cascade');


            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('leads');
    }
};
