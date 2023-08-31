@extends('layout')

@section('content')
<nav class="navbar navbar-expand-lg navbar- d-flex justify-content-center">
    <button class="navbar-toggler" type="button" data-toggle="collapse"
        data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
        aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse main-menu-item justify-content-end"
        id="navbarSupportedContent">
        <ul class="navbar-nav align-items-center">
            <li class="nav-item text-center">
                <a class="nav-link" href={{url("books")}}>Books</a>
            </li>
            <li class="nav-item text-center">
                <a class="nav-link" href={{url("categories")}}>Categories</a>
            </li>
        </ul>
    </div>
</nav>
<h1  class="px-5 mt-0">Categories</h1>
<div class="container">

@if(session()->has("success"))
    <div class="alert alert-success">{{session()->get("success")}}</div>
@endif

@foreach($categories as $category)
{{$loop->iteration}} - <a href={{url("categories/show/$category->id")}}>{{$category->name}}</a> <br>
{{$category->desc}} <br>
@endforeach
<a href={{url("categories/create")}} class="btn btn-success d-flex justify-content-around w-25 m-5">Add Category</a>
<br>
<div  class="d-flex justify-content-around 5">
    {{-- pagination --}}
   
   {{$categories->links()}}   
   </div>
</div>
@endsection

@section('title')
    All Category
@endsection
      
