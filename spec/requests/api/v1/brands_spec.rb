require 'rails_helper'

RSpec.describe "Api::V1::Brands", type: :request do
  describe "GET /index" do
    it 'return http status ok' do
      get '/api/v1/brands/index'
      expect(response). to have_http_status(:ok)
    end
    
  end
end
