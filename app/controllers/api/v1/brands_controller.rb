class Api::V1::BrandsController < ApplicationController
    acts_as_token_authentication_handler_for User, only:[:create,:update,:delete]

    before_action :require_login, :admin_permission, only:[:create,:update,:delete]

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
    
    def update
        brand = Brand.find(params[:id])
        brand.update!(brand_params)
        render json: brand, status: :ok
    rescue StandardError
        head(:bad_request)
    end

    def delete
        brand = Brand.find(params[:id])
        brand.destroy!
        render json: brand, status: :ok
    rescue StandardError
        head(:bad_request)
    end
    
    private

    def brand_params
        params.require(:brand).permit(:name)
    end
end
