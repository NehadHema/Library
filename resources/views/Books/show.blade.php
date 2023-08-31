@extends('layout')

@section('content')
<div class="container">
    Show Book - {{$book->title}}
<a class="btn btn-primary ml-5"  href={{url("books")}}>Back</a>
<br>
Category Name - <a href="{{route("showCategory",["id"=>$book->category_id])}}">{{$book->Category->name}}</a>  <br>
{{$book->desc}}<br>
<img src="{{asset("storage/$book->image")}}" width="100px" alt="" srcset="">
<br>
<div class="d-flex justify-content-center">
    <form action={{url("books/$book->id")}} method="post">
        @csrf
        @method('DELETE')
        
        <button class="btn btn-danger" type="submit">Delete</button>
        <a class="btn btn-success"  href={{url("books/edit/$book->id")}}>Edit</a>
        </form>
        <br>
</div>


    </div>
    @endsection

@section('title')
    One book
@endsection