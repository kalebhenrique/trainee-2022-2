class Api::V1::BrandsController < ApplicationController
    def index
        brand = Brand.all
        render json: brand, status: :ok
    end
    def show
        genre = Genre.find(params[:id])
        render json: genre, status: :ok
    rescue StandardError
        head(:not_found)
    end
end
