@extends('layout')
    
@extends('errors')

    @section('content')
    <form class="mx-5 mt-2" action="{{url('books')}}" method="post" enctype="multipart/form-data" class="m-5">
        @csrf
         <label for="name">Book Name:</label>
         <input type="text" class="ms-3 form-control" name="title" id="title" value="{{old('title')}}" id="">
        {{-- @if ($errors->any())
        <div class="alert alert-danger">
         @error('title')
         {{$message}}
         @enderror
     </div>
        @endif --}}
         <br>
         <label for="desc" class="d-flex">Description:</label>
         <textarea name="desc" id="desc" cols="30" class="form-control" rows="4">{{old('desc')}}</textarea>
         {{-- @if ($errors->any())
         <div class="alert alert-danger">
          @error('desc')
          {{$message}}
          @enderror
      </div>
         @endif --}}
         <br>
         <label for="price">Price:</label>
         <input type="text" class="ms-3 form-control" name="price" id="price" value="{{old('price')}}" id="">
        {{-- @if ($errors->any())
        <div class="alert alert-danger">
         @error('price')
         {{$message}}
         @enderror
        </div>
        @endif --}}
         <br>
         <input type="file" name="image" id="">
         <br>
         <label for="name" class="d-flex mt-3">Category Name:</label>
         <select name="category_id" id="" class="ms-5 form-control">
            @foreach ($categories as $category)
                <option value={{$category->id}}>{{$category->name}}</option>
            @endforeach
         </select>
         <br>
         <button type="submit" class="btn btn-success mx-5">Add</button>
     </form>
    @endsection
 
    @section('title')
    Create Book
    @endsection