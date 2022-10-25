require 'rails_helper'

RSpec.describe "Api::V1::Categories", type: :request do
  describe "GET /index" do
    before do
      create(:category, id:1, name:"Celulares")
      create(:category, id:2, name:"Computadores")
      create(:category, id:3, name:"Periféricos")
    end
    context 'when index return' do
      before do
        get '/api/v1/categories/index'
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
          'name' => "Celulares",
          'created_at' => eval(Category.find(1).created_at.to_json),
          'updated_at' => eval(Category.find(1).updated_at.to_json)
        },
        {
          'id' => 2,
          'name' => "Computadores",
          'created_at' => eval(Category.find(2).created_at.to_json),
          'updated_at' => eval(Category.find(2).updated_at.to_json)
        },
        {
          'id' => 3,
          'name' => "Periféricos",
          'created_at' => eval(Category.find(3).created_at.to_json),
          'updated_at' => eval(Category.find(3).updated_at.to_json)
        }
        ])
      end
    end
  end

  describe " GET /show" do
    let(:category) {create(:category)}
    context 'id exist' do
      before do
        get "/api/v1/categories/show/#{category.id}"
      end
      it 'return http status ok' do
        expect(response).to have_http_status(:ok)
      end
    end
    context 'id not found' do
      before do
        get "/api/v1/categories/show/-1"
      end
      it 'return https not_found' do
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe " POST /create" do
    let(:category_params) do
      attributes_for(:category)
    end
    context 'params are ok' do
      it 'return https status created' do
        p category_params
        post "/api/v1/categories/create", params: {category: category_params}
        expect(response).to have_http_status(:created)
      end
    end
    context 'params are bad' do
      it 'when params is nil' do
        category_params = nil
        post "/api/v1/categories/create", params: {category: category_params}
        expect(response).to have_http_status(:bad_request)
      end
      it 'params is not uniq' do
        post "/api/v1/categories/create", params: {category: category_params}
        post "/api/v1/categories/create", params: {category: category_params}
        expect(response).to have_http_status(:bad_request)
      end
    end
  end

  describe " PATCH /update/:id" do
    let(:category5) {create(:category, name: "Category5")}
    let(:category6) {create(:category, name: "Category6")}
    context 'params are ok' do
      it 'return https status ok' do
        patch "/api/v1/categories/update/#{category5.id}", params: {category: {name: "Notebook"}}
        expect(response).to have_http_status(:ok)
      end
    end
    context 'params are nil' do
      it 'return https status bad_request' do
        patch "/api/v1/categories/update/#{category5.id}", params: {category: {name: nil}}
        expect(response).to have_http_status(:bad_request)
      end
    end
    context 'params are not uniq' do
      it 'return https status bad_request' do
        patch "/api/v1/categories/update/#{category5.id}", params: {category: {name: category6.name}}
        expect(response).to have_http_status(:bad_request)
      end
    end
  end

  describe " DELETE /delete/:id" do
    let(:category) {create(:category)}
    context 'category exist' do
      it 'return https status ok' do
        delete "/api/v1/categories/delete/#{category.id}"
        expect(response).to have_http_status(:ok)
      end
    end
    context 'category does not exist' do
      it 'return https status bad_request' do
        delete "/api/v1/categories/delete/-1"
        expect(response).to have_http_status(:bad_request)
      end
    end
  end
end
