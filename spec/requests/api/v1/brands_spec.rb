require 'rails_helper'

RSpec.describe "Api::V1::Brands", type: :request do
  describe "GET /index" do
    before do
      create(:brand, id:1, name:"Apple")
      create(:brand, id:2, name:"Samsung")
      create(:brand, id:3, name:"Logitech")
    end
    context 'when index return' do
      before do
        get '/api/v1/brands/index'
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
          'name' => "Apple",
          'created_at' => eval(Brand.find(1).created_at.to_json),
          'updated_at' => eval(Brand.find(1).updated_at.to_json)
        },
        {
          'id' => 2,
          'name' => "Samsung",
          'created_at' => eval(Brand.find(2).created_at.to_json),
          'updated_at' => eval(Brand.find(2).updated_at.to_json)
        },
        {
          'id' => 3,
          'name' => "Logitech",
          'created_at' => eval(Brand.find(3).created_at.to_json),
          'updated_at' => eval(Brand.find(3).updated_at.to_json)
        }
        ])
      end
    end
  end

  describe " GET /show" do
    let(:brand) {create(:brand)}
    context 'id exist' do
      before do
        get "/api/v1/brands/show/#{brand.id}"
      end
      it 'return http status ok' do
        expect(response).to have_http_status(:ok)
      end
    end
    context 'id not found' do
      before do
        get "/api/v1/brands/show/-1"
      end
      it 'return https not_found' do
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe " POST /create" do
    let(:user) {create(:user)}
    let(:brand_params) do
      attributes_for(:brand)
    end
    context 'params are ok' do
      it 'return https status created' do
        post "/api/v1/brands/create", params: {brand: brand_params}, headers: {
          'X-User-Email': user.email,
          'X-User-Token': user.authentication_token
        }
        expect(response).to have_http_status(:created)
      end
    end
    context 'params are bad' do
      it 'when params is nil' do
        brand_params = nil
        post "/api/v1/brands/create", params: {brand: brand_params}, headers: {
          'X-User-Email': user.email,
          'X-User-Token': user.authentication_token
        }
        expect(response).to have_http_status(:bad_request)
      end
      it 'params is not uniq' do
        post "/api/v1/brands/create", params: {brand: brand_params}, headers: {
          'X-User-Email': user.email,
          'X-User-Token': user.authentication_token
        }
        post "/api/v1/brands/create", params: {brand: brand_params}, headers: {
          'X-User-Email': user.email,
          'X-User-Token': user.authentication_token
        }
        expect(response).to have_http_status(:bad_request)
      end
    end
  end

  describe " PATCH /update/:id" do
    let(:user) {create(:user)}
    let(:brand5) {create(:brand, name: "Brand5")}
    let(:brand6) {create(:brand, name: "Brand6")}
    context 'params are ok' do
      it 'return https status ok' do
        patch "/api/v1/brands/update/#{brand5.id}", params: {brand: {name: "Intel"}}, headers: {
          'X-User-Email': user.email,
          'X-User-Token': user.authentication_token
        }
        expect(response).to have_http_status(:ok)
      end
    end
    context 'params are nil' do
      it 'return https status bad_request' do
        patch "/api/v1/brands/update/#{brand5.id}", params: {brand: {name: nil}}, headers: {
          'X-User-Email': user.email,
          'X-User-Token': user.authentication_token
        }
        expect(response).to have_http_status(:bad_request)
      end
    end
    context 'params are not uniq' do
      it 'return https status bad_request' do
        patch "/api/v1/brands/update/#{brand5.id}", params: {brand: {name: brand6.name}}, headers: {
          'X-User-Email': user.email,
          'X-User-Token': user.authentication_token
        }
        expect(response).to have_http_status(:bad_request)
      end
    end
  end

  describe " DELETE /delete/:id" do
    let(:user) {create(:user)}
    let(:brand) {create(:brand)}
    context 'brand exist' do
      it 'return https status ok' do
        delete "/api/v1/brands/delete/#{brand.id}", headers: {
          'X-User-Email': user.email,
          'X-User-Token': user.authentication_token
        }
        expect(response).to have_http_status(:ok)
      end
    end
    context 'brand does not exist' do
      it 'return https status bad_request' do
        delete "/api/v1/brands/delete/-1", headers: {
          'X-User-Email': user.email,
          'X-User-Token': user.authentication_token
        }
        expect(response).to have_http_status(:bad_request)
      end
    end
  end
end