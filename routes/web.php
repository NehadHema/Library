<?php

use App\Http\Controllers\ApiCategoryController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\BookController;
use App\Http\Controllers\CateogryController;
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



Route::controller(CateogryController::class)->group(function(){
    Route::get("categories","all");
    Route::get("categories/show/{id}","show")->name("showCategory");
    Route::get("categories/create","create");
    Route::post("categories","store");
    
    Route::get("categories/edit/{id}","edit");
    Route::put("categories/{id}","update");
    
    Route::delete("categories/{id}","delete");
});


Route::controller(BookController::class)->group(function(){
    Route::get("books","all")->name("allBooks");

    Route::middleware('auth')->group(function(){
        Route::get("books/show/{id}","show")->name("showBook");
        Route::get("books/create","create");
        Route::post("books","store");
        
        Route::get("books/edit/{id}","edit");
        Route::put("books/{id}","update")->name("updateBook");
        
        Route::delete("books/{id}","delete");

        Route::post('logout',[AuthController::class,'logout'])->name('logout');

    });
   
});

Route::middleware('guest')->group(function(){
// Auth(register)
Route::get('register',[AuthController::class,'registerForm'])->name('registerForm');
Route::post('register',[AuthController::class,'register'])->name('register');
// Auth(login)
Route::get('login',[AuthController::class,'loginForm'])->name('loginForm');
Route::post('login',[AuthController::class,'login'])->name('login');

});


Route::get('users',[AuthController::class,'allUsers'])->middleware('is_admin','auth');

// Api


Route::get("change/{lang}",function($lang){

    // lang
    if($lang == "ar"){
        session()->put("lang","ar");
    }else{
        session()->put("lang","en");
    }

    return redirect()->back();
});