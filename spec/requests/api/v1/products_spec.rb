require 'rails_helper'

RSpec.describe "Api::V1::Products", type: :request do
  describe "GET /index" do
    before do
      create(:product, id:1, name:"Samsung A13")
      create(:product, id:2, name:"Samsung Odyssey")
      create(:product, id:3, name:"Mouse Logitech")
    end
    context 'when index return' do
      before do
        get '/api/v1/products/index'
      end
      it 'return http status ok' do
        expect(response).to have_http_status(:ok)
      end
      it 'return a json' do
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
      it 'return created instances' do
        expect(JSON.parse(response.body)).to eq([{
          'id' => 1,
          'name' => "Samsung A13",
          'price' => 100000,
          'description' => "Smartphone",
          'inventory' => 50,
          'category_id' => 1,
          'brand_id' => 2,
          'created_at' => eval(Product.find(1).created_at.to_json),
          'updated_at' => eval(Product.find(1).updated_at.to_json)
        },
        {
          'id' => 2,
          'name' => "Samsung Odyssey",
          'price' => 500000,
          'description' => "LAptop",
          'inventory' => 10,
          'category_id' => 2,
          'brand_id' => 2,
          'created_at' => eval(Product.find(2).created_at.to_json),
          'updated_at' => eval(Product.find(2).updated_at.to_json)
        },
        {
          'id' => 3,
          'name' => "Mouse Logitech",
          'price' => 3000, 
          'description' => "Mouse",
          'inventory' => 60, 
          'category_id' => 3,
          'brand_id' => 3,
          'created_at' => eval(Product.find(3).created_at.to_json),
          'updated_at' => eval(Product.find(3).updated_at.to_json)
        }
        ])
      end
    end
  end

  describe " GET /show" do
    let(:product) {create(:product)}
    context 'id exist' do
      before do
        get "/api/v1/products/show/#{product.id}"
      end
      it 'return http status ok' do
        expect(response).to have_http_status(:ok)
      end
    end
    context 'id not found' do
      before do
        get "/api/v1/products/show/-1"
      end
      it 'return https not_found' do
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe " POST /create" do
    let(:product_params) do
      attributes_for(:product)
    end
    context 'params are ok' do
      it 'return https status created' do
        p product_params
        post "/api/v1/products/create", params: {product: product_params}
        expect(response).to have_http_status(:created)
      end
    end
    context 'params are bad' do
      it 'when params is nil' do
        product_params = nil
        post "/api/v1/products/create", params: {product: product_params}
        expect(response).to have_http_status(:bad_request)
      end
      it 'params is not uniq' do
        post "/api/v1/products/create", params: {product: product_params}
        post "/api/v1/products/create", params: {product: product_params}
        expect(response).to have_http_status(:bad_request)
      end
    end
  end

  describe " PATCH /update/:id" do
    let(:product5) {create(:product, name: "Product5")}
    let(:product6) {create(:product, name: "Product6")}
    context 'params are ok' do
      it 'return https status ok' do
        patch "/api/v1/products/update/#{product5.id}", params: {product: {name: "Mouse Razer"}}
        expect(response).to have_http_status(:ok)
      end
    end
    context 'params are nil' do
      it 'return https status bad_request' do
        patch "/api/v1/products/update/#{product5.id}", params: {product: {name: nil}}
        expect(response).to have_http_status(:bad_request)
      end
    end
    context 'params are not uniq' do
      it 'return https status bad_request' do
        patch "/api/v1/products/update/#{product5.id}", params: {product: {name: product6.name}}
        expect(response).to have_http_status(:bad_request)
      end
    end
  end

  describe " DELETE /delete/:id" do
    let(:product) {create(:product)}
    context 'product exist' do
      it 'return https status ok' do
        delete "/api/v1/products/delete/#{product.id}"
        expect(response).to have_http_status(:ok)
      end
    end
    context 'product does not exist' do
      it 'return https status bad_request' do
        delete "/api/v1/products/delete/-1"
        expect(response).to have_http_status(:bad_request)
      end
    end
  end
end
