<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void {
        Schema::create('failed_logins', function (Blueprint $table) {
            $table->id();
            $table->string('email');
            $table->ipAddress('ip')->nullable();
            $table->timestamps();
        });
    }
    public function down(): void {
        Schema::dropIfExists('failed_logins');
    }
};
