class Api::V1::CartsController < ApplicationController
    acts_as_token_authentication_handler_for User, only:[:create,:delete]
    
    before_action :require_login, :admin_permission, only:[:create,:delete]

    def create
        cart = Cart.new(cart_params)
        cart.save!
        render json: cart, status: :created
    rescue StandardError
        head(:bad_request)
    end

    def delete
        cart = Cart.find(params[:id])
        cart.destroy!
        render json: cart, status: :ok
    rescue StandardError
        head(:bad_request)
    end

    def show
        cart = Cart.find(params[:id])
        render json: cart, status: :ok
    rescue StandardError
        head(:not_found)
    end
    
    private

    def cart_params
        params.require(:cart).permit(
            :product_id, 
            :user_id)
    end
end
