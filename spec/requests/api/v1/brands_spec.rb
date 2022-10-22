require 'rails_helper'

RSpec.describe "Api::V1::Brands", type: :request do
  describe "GET /index" do
    before do
      create(:brands, id:1, name:"Apple")
      create(:brands, id:2, name:"Samsung")
      create(:brands, id:3, name:"Logitech")
    end
    context 'when index return' do
      before do
        get '/api/v1/brands/index'
      end
      it 'return http status ok' do
        expect(response).to have_http_status(:ok)
      end
      it 'return a json' do
        expect(response.content_type).to eq('application/json;charset=utf-8')
      end
      it 'return created instances' do
        expect(JSON.parse(response.body)).to eq([{
          'id' => 1,
          'name' => "Apple"
        },
        {
          'id' => 2,
          'name' => "Samsung"
        },
        {
          'id' => 3,
          'name' => "Logitech"
        }
        ])
      end
    end
  end
end
