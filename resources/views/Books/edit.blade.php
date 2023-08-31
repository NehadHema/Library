@extends('layout')
@extends('errors')
    @section('content')
    <form class="mx-5 mt-2" action="{{route('updateBook',["id"=>$book->id])}}" method="post" enctype="multipart/form-data">
        @csrf
        @method('PUT')
        <input type="hidden" name="category_id" value="{{$book->category->id}}">

         <label for="name">Book Name:</label>
         <input type="text" class="ms-3 form-control" name="title" id="title" value="{{$book->title}}" id="">
        {{-- @if ($errors->any())
        <div class="alert alert-danger">
         @error('title')
         {{$message}}
         @enderror
     </div>
        @endif --}}
         <br>
         <label for="desc" class="d-flex">Description:</label>
         <textarea name="desc" id="desc" class="form-control" cols="30" rows="4">{{$book->desc}}</textarea>
         {{-- @if ($errors->any())
         <div class="alert alert-danger">
          @error('desc')
          {{$message}}
          @enderror
      </div>
         @endif --}}
         <br>
         <label for="price">Price:</label>
         <input type="text" class="ms-3 form-control" name="price" id="price" value="{{$book->price}}" id="">
        {{-- @if ($errors->any())
        <div class="alert alert-danger">
         @error('price')
         {{$message}}
         @enderror
        </div>
        @endif --}}
         <br>
         <img src="{{asset("storage/books/$book->image")}}" width="100px" alt="" srcset="">
         <input type="file" name="image" id="">
         <br>
         <label for="name" class="d-flex mt-3">Category Name:</label>
         <select name="book_id" id="" class="ms-5 form-control">
            <option value={{$book->category_id}}>{{$book->category->name}}</option>

            @foreach ($categories as $category)
                <option value={{$category->id}}>{{$category->name}}</option>
            @endforeach

         </select>
         <br>
         <button type="submit" class="btn btn-success mr-5">Update</button>
     </form>
    @endsection
 
    @section('title')
    Create Category
    @endsection