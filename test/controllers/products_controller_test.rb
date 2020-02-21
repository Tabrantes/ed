require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one)
    @title = "The Great Book #{rand(1000)}"

  end

test "should create product" do
  assert_difference('Product.count') do

  post products_url, params: {
      product: {
        description: @product.description,
        image_url: @product.image_url,
        price: @product.price,
        title: @title,
      }
    }
 end

 assert_redirected_to product_url(Product.last)
end

test "should update product" do

  patch product_url(@product), params: {
     product: {
       description: @product.description,
       image_url: @product.image_url,
       price: @product.price,
       title: @title,
     }
  }
    assert_redirected_to product_url(@product)
  end
end

test "can't delete product in cart" do
  assert_difference('Product.Count' 0) do
    delete product_url(products(:two))
  end

  assert_redirected_to products_url
end

test "shoul destroy product" do
  assert_difference('Product.count', -1) do
    delete product_url(@product)
  end

  assert_redirect_to products_url
end
