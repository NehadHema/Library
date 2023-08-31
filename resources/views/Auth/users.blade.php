@extends('layout')

@section('content')
<h1 class="px-5">Users</h1>

<div class="container">
    <table class="table">
        <thead>
          <tr>
            <th scope="col">#</th>
            <th scope="col">User Name</th>
          </tr>
        </thead>
        <tbody>
            <tr>
            @foreach ($users as $user)
            <td>{{$loop->iteration}}</td>
            <td>{{$user->name}}</td>
            </tr>
            @endforeach
        </tbody>
      </table>
@endsection

@section('title')
    All students
@endsection
      
