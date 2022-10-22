class Api::V1::BrandsController < ApplicationController
    def index
        brand = Brand.all
        render json: brand, status: :ok
    end

    def show
        brand = Brand.find(params[:id])
        render json: brand, status: :ok
    rescue StandardError
        head(:not_found)
    end

    def create
        brand = Brand.new(brand_params)
        brand.save!
        render json: brand, status: :created
    rescue StandardError
        head(:bad_request)
    end
    
    private

    def brand_params
        params.require(:brand).permit(:name)
    end
end
