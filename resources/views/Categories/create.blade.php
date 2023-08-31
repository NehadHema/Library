@extends('layout')
    
{{-- @extends('errors') --}}

    @section('content')
    <form class="mx-5 mt-2" action="{{url('categories')}}" method="post" enctype="multipart/form-data" class="m-5">
        @csrf
         <label for="name">Name:</label>
         <input type="text" class="ms-3 form-control" name="name" id="name" value="{{old('name')}}" id="">
        @if ($errors->any())
        <div class="alert alert-danger">
         @error('name')
         {{$message}}
         @enderror
     </div>
        @endif
         <br>
         <label for="desc" class="d-flex">Description:</label>
         <textarea name="desc" id="desc" class="form-control" cols="30" rows="10">{{old('desc')}}</textarea>
         @if ($errors->any())
         <div class="alert alert-danger">
          @error('desc')
          {{$message}}
          @enderror
      </div>
         @endif
         <br>
         <input type="file" name="image" id="">
         <br><br>
         <button type="submit" class="btn btn-success mx-5">Add</button>
     </form>
    @endsection
 
    @section('title')
    Create Category
    @endsection