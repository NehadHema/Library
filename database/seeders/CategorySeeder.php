<?php

namespace Database\Seeders;

use App\Models\Category;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class CategorySeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // DB::table('categories')->insert([
        //     "name"=>"category One",
        //     "desc"=>"new desc",
        // ]);

        // or talk the method
          for ($i=1; $i <5 ; $i++) { 
            Category::create([
                "name"=>Str::random(10),
                "desc"=>Str::random(50),
             ]);
          }
    }
}
