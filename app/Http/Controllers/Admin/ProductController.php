<?php

namespace App\Http\Controllers\Admin;

use Cloudinary\Cloudinary;
use App\Http\Controllers\Controller;
use App\Http\Requests\ProductStoreRequest;
use App\Http\Requests\ProductUpdateRequest;
use App\Models\Category;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class ProductController extends Controller
{
    public function index(Request $request)
    {
        $q = $request->input('q');
        $products = Product::when($q, fn($query) =>
            $query->where('name','like',"%{$q}%")
        )->with('category')->latest()->paginate(12)->withQueryString();

        return view('admin.products.index', compact('products','q'));
    }

    public function create()
    {
        $categories = Category::orderBy('name')->get();
        return view('admin.products.create', compact('categories'));
    }

    public function store(ProductStoreRequest $request)
    {
        $data = $request->validated();
        $data['slug'] = Str::slug($data['name'].'-'.Str::random(6));

        if ($request->hasFile('image')) {
            try {
                // Use the working Cloudinary configuration
                $cloudinary = new Cloudinary([
                    'cloud' => [
                        'cloud_name' => 'dfnzcn8dl',
                        'api_key' => '543959871613564',
                        'api_secret' => 'A6vgVVwrMJDxZHJ3H0hVn8K0nKs',
                    ]
                ]);
                
                $uploadResult = $cloudinary->uploadApi()->upload(
                    $request->file('image')->getRealPath()
                );
                
                $data['image_url'] = $uploadResult['secure_url'];
                
            } catch (\Exception $e) {
                return redirect()->back()
                    ->withInput()
                    ->with('error', 'Image upload failed: ' . $e->getMessage());
            }
        }

        Product::create($data);
        return redirect()->route('admin.dashboard')->with('success','Product created.');
    }

    public function edit(Product $product)
    {
        $categories = Category::orderBy('name')->get();
        return view('admin.products.edit', compact('product','categories'));
    }

    public function update(ProductUpdateRequest $request, Product $product)
    {
        $data = $request->validated();

        if ($request->hasFile('image')) {
            try {
                $cloudinary = new Cloudinary([
                    'cloud' => [
                        'cloud_name' => 'dfnzcn8dl',
                        'api_key' => '543959871613564',
                        'api_secret' => 'A6vgVVwrMJDxZHJ3H0hVn8K0nKs',
                    ]
                ]);
                
                $uploadResult = $cloudinary->uploadApi()->upload(
                    $request->file('image')->getRealPath()  
                );
                
                $data['image_url'] = $uploadResult['secure_url'];
                
            } catch (\Exception $e) {
                return redirect()->back()
                    ->withInput()
                    ->with('error', 'Image upload failed: ' . $e->getMessage());
            }
        }

        $product->update($data);
        return redirect()->route('admin.dashboard')->with('success','Product updated.');
    }

    public function destroy(Product $product)
    {
        $product->delete();
        return back()->with('success','Product deleted.');
    }
}