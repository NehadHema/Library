<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class ApiAuthController extends Controller
{
   public function register(Request $request){

    // validation
    $validator = Validator::make($request->all(),[
        "name"=>"required|string|max:100",
        "email"=>"required|email|unique:users,email",
        "password"=>"required|string|max:100|confirmed",
    ]);

    if($validator->fails()){
        return response()->json([
            "msg"=>$validator->errors()
        ],301);
    }
    // password hash
    $request->password = bcrypt($request->password);
    // create
    User::create([
        "name"=>$request->name,
        "email"=>$request->email,
        "password"=>$request->password,
    ]);
    // msg
    return response()->json([
        "msg"=>"You registed successfully"
    ],201);
    
   }
}
