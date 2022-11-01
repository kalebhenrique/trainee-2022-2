require 'rails_helper'

RSpec.describe "Api::V1::Carts", type: :request do
  describe "GET /show" do
    let(:cart) {create(:cart)}
    context 'id exist' do
      before do
        get "/api/v1/carts/show/#{cart.id}"
      end
      it 'return http status ok' do
        expect(response).to have_http_status(:ok)
      end
    end
    context 'id not found' do
      before do
        get "/api/v1/carts/show/-1"
      end
      it 'return https not_found' do
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe " POST /create" do
    let(:user) {create(:user)}
    let(:cart_params) do
      attributes_for(:cart)
    end
    context 'params are ok' do
      it 'return https status created' do
        p cart_params
        post "/api/v1/carts/create", params: {cart: cart_params}, headers: {
          'X-User-Email': user.email,
          'X-User-Token': user.authentication_token
        }
        expect(response).to have_http_status(:created)
      end
    end
    context 'params are bad' do
      it 'when params is nil' do
        cart_params = nil
        post "/api/v1/carts/create", params: {cart: cart_params}, headers: {
          'X-User-Email': user.email,
          'X-User-Token': user.authentication_token
        }
        expect(response).to have_http_status(:bad_request)
      end
      it 'params is not uniq' do
        post "/api/v1/carts/create", params: {cart: cart_params}, headers: {
          'X-User-Email': user.email,
          'X-User-Token': user.authentication_token
        }
        post "/api/v1/carts/create", params: {cart: cart_params}, headers: {
          'X-User-Email': user.email,
          'X-User-Token': user.authentication_token
        }
        expect(response).to have_http_status(:bad_request)
      end
    end
  end

  describe " DELETE /delete/:id" do
    let(:user) {create(:user)}
    let(:cart) {create(:cart)}
    context 'cart exist' do
      it 'return https status ok' do
        delete "/api/v1/carts/delete/#{cart.id}", headers: {
          'X-User-Email': user.email,
          'X-User-Token': user.authentication_token
        }
        expect(response).to have_http_status(:ok)
      end
    end
    context 'cart does not exist' do
      it 'return https status bad_request' do
        delete "/api/v1/carts/delete/-1", headers: {
          'X-User-Email': user.email,
          'X-User-Token': user.authentication_token
        }
        expect(response).to have_http_status(:bad_request)
      end
    end
  end
end
