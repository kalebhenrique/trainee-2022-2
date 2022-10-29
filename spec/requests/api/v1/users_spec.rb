require 'rails_helper'

RSpec.describe "Api::V1::Users", type: :request do
  describe "admin login" do
    before do
      create(:user, email: 'listaut@gmail', password: '123456')
    end
    context 'when admin has no valid email' do
      it ' return http unauthorized' do
        get '/api/v1/users/login', params: {
          email: 'listaaut@gmai',
          password: '123456'
        }
        expect(response).to have_http_status(:unauthorized)
      end
    end
    context 'when admin has no valid password' do
      it ' return http unauthorized' do
        get '/api/v1/users/login', params: {
          email: 'listaaut@gmail',
          password: '1234567'
        }
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
  describe 'admin logout' do
    let(:user) {create(:user)}
    before do
      get '/api/v1/users/login', params: {
        email: 'listaaut@gmail',
        password: '123456'
      }
    end
    context 'when admin is loged' do
      it 'return http status ok' do
        get '/api/v1/users/logout', headers: {
          'X-User-Email': user.email,
          'X-User-Token': user.authentication_token
        }
      end
    end
  end
end
