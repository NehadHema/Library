<?php

namespace App\Http\Controllers;

use App\Http\Resources\CategoryResource;
use App\Models\Category;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;

class ApiCategoryController extends Controller
{
    public function all(){
        $categories = Category::all();//object collection because return all category
        // json
        return CategoryResource::collection($categories);
    }
  

    public function show($id){
        // check
        $category = Category::find($id);
        if($category == null){
            return response()->json([
                "msg"=>"category not found"
            ],404);
        }
        return new CategoryResource($category);
    }

    public function store(Request $request){
    // validation
    $validator = Validator::make($request->all(), [
        "name"=>"required|string|max:255",
        "desc"=>"required|string",
        "image"=>"required|image|mimes:png,jpg,jpeg",
    ]);

    if($validator->fails()) {
        return response()->json([
            "msg"=>$validator->errors()
        ], 301);
    }
    // storage
    $imageName = Storage::putFile("categories", $request);
    // create
    Category::create([
     "name" =>$request->name,
     "desc" =>$request->desc,
     "image" =>$request->image,
    ]);

    // return msg , code 
    return response()->json([
        "msg"=>$validator->errors()
    ], 201);//201 success and create 
    }

    public function update($id,Request $request){
        // validation
        $validator = Validator::make($request->all(),[
            "name"=>"required|string|max:255",
            "desc"=>"required|string",
            "image"=>"image|mimes:png,jpg,jpeg",
        ]);

        if($validator->fails()){
            return response()->json([
                "msg"=>$validator->errors()
            ],301);
        }
        // find
        $category = Category::find($id);
        if($category == null){
            return response()->json([
                "msg"=>"category not found"
            ],404);
        }
        // image
        $imageName=$category->image;//old image
        if($request->has('image')){
            // storage
            if($imageName != null){
                Storage::delete($category->image);
            }
            $imageName = Storage::putFile("categories",$request->image);//new image
        }
        // update
        $category->update([
         "name"=>$request->name,
         "desc"=>$request->desc,
         "image"=>$imageName,
        ]);

        // msg
        return response()->json([
            "msg"=>"category updated successfuly",
            "data"=>new CategoryResource($category)
        ],200);
    }

    public function delete($id){
        $category = Category::find($id);
        if($category == null){
            return response()->json([
                "msg"=>"category not found"
            ],404);
        }
        Storage::delete($category->image);
        $category->delete();
        return response()->json([
            "msg"=>"Category deleted successfully"
        ],200);
    }
}
