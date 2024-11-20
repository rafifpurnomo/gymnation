<?php

use App\Http\Controllers\authController;
use App\Http\Controllers\carouselController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', [carouselController::class, 'mainCarousel'],function () {
    return view('home');
})->name('home');

Route::get('/loginPage', function () {
    return view('login');
})->name('login.form');
Route::post('/login', [authController::class, 'login'])->name('login.process');

Route::middleware(['checkLogin'])->group(function () {
    Route::get('/admin/Home',  function () {
        return view('adminHome');
    })->name('admin.home');
    
    Route::get('/admin/carouselSettings',  [carouselController::class, 'adminMainCarousel'], function () {
        return view('adminCarousel');
    })->name('admin.carousel');
});