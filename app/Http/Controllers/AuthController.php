<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class AuthController extends Controller
{
    public function registerForm(){
        return view('Auth.register');
    }


    public function register(Request $request){
        // validation
        $data = $request->validate([
         "name"=>'required|string|max:100',
         "email"=>'required|email|max:100|unique:users,email',
         "password"=>'required|string|min:6|confirmed',
        ]);

        // password
        $data['password']=bcrypt($data['password']);
        $user = User::create($data);
        // to make login
        Auth::login($user);
        // redirect
        return redirect(url('books'));
    }

    public function loginForm(){
        return view('Auth.login');
    }

    public function login(Request $request){
        // validation
        $data = $request->validate([
         "email"=>'required|email|max:100',
         "password"=>'required|string|min:6'
        ]);

        $is_Auth = Auth::attempt(["email"=>$data['email'],"password"=>$data['password']]);
        if(! $is_Auth){
        // redirect
        return redirect(url('login'))->withErrors("credintails not correct");
        }
        return redirect(url('books'));
        
    }

    public function logout(){
        Auth::logout();
        return redirect(url('login'));
    }


    public function allUsers(){
        // dd(User::all());
        $data['users'] = User::all();
        return view('Auth.users')->with($data);
    }
}
