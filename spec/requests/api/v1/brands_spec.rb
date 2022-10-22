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
end
