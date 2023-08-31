<?php

namespace App\Http\Controllers;

use App\Models\Category;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;

class CateogryController extends Controller
{
    // public function all($x=null,$y=null){
    //     $fullName= $x." ".$y;
    //     return view("allview")->with("fullName",$fullName);
    // }
//     public function all(){
//         $posts= DB::table('posts')->select('title','body')->get();
// // dd($posts);
//         return view('Categories.all',["posts"=>$posts]); 
//     }
public function all(){
// $categories = Category::all();
// $categories = Category::select('name','desc')->get();
// $categories = Category::orderBy('id','desc')->limit(1)->get();
// $categories = Category::select('name','desc')->where('id','>',2)->get();
// $categories = Category::select('name','desc')->where('id','>',2)->where('name','sofa')->get();
// $categories = Category::select('name','desc')->where('id','>',2)->where('name','!=','sofa')->get();
// $categories = Category::select('name','desc')->where('id','>',2)->orWhere('name','!=','sofa')->get();
// $categories = Category::select('name','desc')->orderBy('id','desc')->get();
// $categories = Category::orderBy('id','desc')->take(1)->get();

// dd($categories);
// $categories = DB::table('categories')->pluck('name','desc');
 
// foreach ($categories as $desc=>$name) {
//     echo "name". $name. "<br>";
//     echo "desc". $desc. "<hr>";
// }

$categories = Category::paginate(3);

return view('Categories.all',compact(['categories']));
}

public function show($id){
    // $category = Category::find($id);
    $category = Category::findOrFail($id);

    return view('Categories.show',compact(['category']));
}

public function create(){
    return view("Categories.create");
}
public function store(Request $request){
    // echo $_POST['name'];
   echo $request->name;
//    validation
$data = $request->validate([
"name"=>'required|string|max:100',
"desc"=>'required|string',
"image"=>'required|image|mimes:jpg,jpeg,png',
]);
$data['image'] = Storage::putFile("categories",$data['image']);
// store
// Category::create([
// "name"=>$request->name,
// "desc"=>$request->desc,
// ]);

////
Category::create($data);
// session()->put("success","data inserted successfully");
session()->flash("success","data inserted successfully");
// redirect
// return redirect(url('categories'));
/////////////////////////
// $categories= Category::select('name','desc')->get();
// return view("Categories.all")->with("categories",$categories);
/////////////////
return redirect()->action([CateogryController::class,"all"]);//method
}

public function edit($id){
    $category = Category::findOrFail($id);
    return view("Categories.edit")->with('category',$category);
}

public function update($id,Request $request){
$data = $request->validate([
    "name"=>'required|string|max:100',
    "desc"=>'required|string',
    'image'=>'image|mimes:png,jpg,jpeg',
]);
$category = Category::findOrFail($id);
if($request->has('image')){
    Storage::delete("$category->image");
    $data['image'] = Storage::putFile("categories",$data['image']);
}
$category->update($data);

return view('Categories.show',compact(['category']));

}
public function delete($id){
    // echo "delete";
    $category = Category::findOrFail($id);
    Storage::delete("$category->image");
    $category->delete();
    return redirect()->action([CateogryController::class,"all"]);
}

}
