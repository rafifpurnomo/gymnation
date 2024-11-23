<?php

use App\Http\Controllers\authController;
use App\Http\Controllers\carouselController;
use App\Http\Controllers\pengaudanController;
use App\Http\Controllers\resetPass;
use App\Http\Controllers\userController;
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

Route::get('/', [carouselController::class, 'mainCarousel'], function () {
    return view('home');
})->name('home');
Route::post('/addPengaduan', [pengaudanController::class, 'addPengaduan'])->name('addPengaduan.process');

Route::get('/admin', function () {
    return view('login');
})->name('login.form');
Route::post('/login', [authController::class, 'login'])->name('login.process');
Route::post('/logout', [authController::class, 'logout'])->name('logout');

Route::get('/registerPage', function () {
    return view('register');
})->name('register.form');

Route::get('/resetPassword/{token}', [resetPass::class, 'showResetPasswordForm'])->name('resetPassword');
Route::post('/requestResetPassword', [resetPass::class, 'requestResetPass'])->name('requestReset.password');
Route::post('/resetPassword/{token}', [resetPass::class, 'resetPassword'])->name('reset.password');

Route::middleware(['checkLogin'])->group(function () {
    Route::get('/admin/Home', function () {
        return view('adminHome');
    })->name('admin.home');
    
    Route::get('/admin/Laporan', [pengaudanController::class, 'mainLaporan'], function () {
        return view('adminLaporan');
    })->name('admin.laporan');
    Route::delete('/admin/deleteLaporan', [pengaudanController::class, 'deletePengaduan'])->name('admin.deletePengaduan');
    
    Route::get('/admin/carouselSettings', [carouselController::class, 'adminMainCarousel'], function () {
        return view('adminCarousel');
    })->name('admin.carousel');
    Route::delete('/admin/deleteCarousel', [carouselController::class, 'deleteCarousel'])->name('admin.deleteCarousel');
    Route::post('/admin/addCarousel', [carouselController::class, 'addCarousel'])->name('admin.addCarousel');
    
    Route::get('/admin/profile', function () {
        return view('adminProfile');
    })->name('admin.profile');
    
    Route::get('/admin/user', [userController::class, 'userReports'],function () {
        return view('adminUser');
    })->name('admin.user');
    Route::delete('/admin/deleteUser', [userController::class, 'deleteUser'])->name('admin.deleteUser');
    Route::post('/admin/tambahUser', [userController::class, 'addUser'])->name('admin.addUser');
});
