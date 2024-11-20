<?php

use App\Http\Controllers\carouselController;
use Illuminate\Support\Facades\Route;

Route::get('/', [carouselController::class, 'mainCarousel'],function () {
    return view('home');
})->name('home');
