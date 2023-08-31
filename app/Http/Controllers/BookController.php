<?php

namespace App\Http\Controllers;

use App\Models\Book;
use App\Models\Category;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class BookController extends Controller
{
    public function all(){
        $books = Book::paginate(3);
        return view('books.all',compact(['books']));
        }

  // another method
    // public function all()
    // {
    //     $categories = Category::all();

    //     return [

    //         "status" => "Done",
    //         "category_list" => $categories

    //     ];

    // }
    // another solution
    // public function all()
    // {
    //     # code...
    //     $categories = Category::all();
    //     $books = Book::all();

    //     return [

    //         "status" => "Done",
    //         "category_list" => $categories,
    //         "book_list" => $books
    //     ];
    // }
        public function show($id){
            // $books = books::find($id);
            $book = Book::findOrFail($id);
        
            return view('books.show',compact(['book']));
        }


        public function create(){
            $categories = Category::all();
            return view("books.create")->with("categories",$categories);
        }


        public function store(Request $request){
        $data = $request->validate([
        "title"=>'required|string|max:100',
        "desc"=>'required|string',
        "image"=>'required|image|mimes:jpg,jpeg,png',
        "price"=>'required|numeric',
        "category_id"=>'required|exists:categories,id',
        ]);
        $data['image'] = Storage::putFile("books",$data['image']);
        $data['user_id']=2;
        Book::create($data);
        session()->flash("success","data inserted successfully");
        return redirect()->route('allBooks');//method
        }

        public function edit($id){
            $book = Book::findOrFail($id);
            $categories = Category::all();
            return view("books.edit",['book'=>$book,'categories'=>$categories]);
        }


        public function update($id,Request $request){
            $data = $request->validate([
                "title"=>'required|string|max:100',
                "desc"=>'required|string',
                'image'=>'image|mimes:png,jpg,jpeg',
                "price"=>'required|numeric',
                "category_id"=>'required|exists:categories,id',        
            ]);
            $book = Book::findOrFail($id);
            if($request->has('image')){
                Storage::delete("$book->image");
                $data['image'] = Storage::putFile("books",$data['image']);
            }
            $book->update($data);
            
            return redirect()->route("showBook",["id"=>$id]);
            
            }


            public function delete($id){
                // echo "delete";
                $book = Book::findOrFail($id);
                Storage::delete("$book->image");
                $book->delete();
                return redirect()->action([BookController::class,"all"]);
            }
}
