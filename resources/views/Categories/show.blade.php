@extends('layout')

@section('content')
<div class="container">

Show Cateogry - {{$category->name}}
<a class="btn btn-primary ml-5"  href={{url("categories")}}>Back</a>
<br>
Book Name - 
<ul>
    @foreach ($category->books as $book)
    <li>
        <a href="{{route("showBook",["id"=>$book->id])}}"> {{$book->title}} </a>
    </li>
    @endforeach
</ul>
<br>
{{$category->desc}}<br>
<img src="{{asset("storage/$category->image")}}" width="100px" alt="" srcset="">
<br>
<div class="d-flex justify-content-center">
    <form action={{url("categories/$category->id")}} method="post">
        @csrf
        @method('DELETE')
        
        <button class="btn btn-danger" type="submit">Delete</button>
        <a class="btn btn-success"  href={{url("categories/edit/$category->id")}}>Edit</a>
        </form>
        <br>
</div>
</div>
@endsection

@section('title')
    One Category
@endsection