<?php

use App\Http\Controllers\ApiAuthController;
use App\Http\Controllers\ApiCategoryController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::get('categories',[ApiCategoryController::class,"all"]);
Route::get("categories/show/{id}",[ApiCategoryController::class,"show"]);

Route::post('categories/store',[ApiCategoryController::class,"store"]);

Route::put("categories/update/{id}",[ApiCategoryController::class,"update"]);


Route::delete("categories/delete/{id}",[ApiCategoryController::class,"delete"]);


// Auth
Route::post('register',[ApiAuthController::class,'register']);

Route::post('login',[ApiAuthController::class,'login']);