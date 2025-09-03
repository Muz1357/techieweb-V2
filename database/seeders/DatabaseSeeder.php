<?php

namespace Database\Seeders;

use App\Models\User;
use App\Models\Category;
use App\Models\Product;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class DatabaseSeeder extends Seeder
{
    public function run(): void
    {
        // Admin
        User::updateOrCreate(
            ['email' => 'admin@shop.test'],
            [
                'name' => 'Admin',
                'password' => Hash::make('password'),
                'role' => 'admin',
            ]
        );

        // Customer
        User::updateOrCreate(
            ['email' => 'customer@shop.test'],
            [
                'name' => 'Customer',
                'password' => Hash::make('password'),
                'role' => 'customer',
            ]
        );

        $cat1 = Category::firstOrCreate(['name'=>'Laptops']);
        $cat2 = Category::firstOrCreate(['name'=>'Phones']);
        $cat3 = Category::firstOrCreate(['name'=>'Accessories']);

        Product::firstOrCreate(['name'=>'UltraBook Pro 14'], [
            'category_id' => $cat1->id,
            'description' => 'Slim, fast, reliable.',
            'price' => 1499.00,
            'stock' => 10,
            'image_url' => 'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?q=80&w=1200',
        ]);

        Product::firstOrCreate(['name'=>'SmartPhone X'], [
            'category_id' => $cat2->id,
            'description' => 'Flagship camera & battery.',
            'price' => 999.00,
            'stock' => 20,
            'image_url' => 'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?q=80&w=1200',
        ]);

        Product::firstOrCreate(['name'=>'Wireless Headset'], [
            'category_id' => $cat3->id,
            'description' => 'Noise canceling over-ear.',
            'price' => 199.99,
            'stock' => 50,
            'image_url' => 'https://images.unsplash.com/photo-1518443895914-6f7f1a6e9f7c?q=80&w=1200',
        ]);
    }
}
