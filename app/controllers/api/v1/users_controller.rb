class Api::V1::UsersController < ApplicationController
    def login
        user = User.find_by!(email: params[:email])
        if user.valid_password?(params[:password])
            render json: user, status: :ok
        else
            head(:unauthorized)
        end
    rescue StandardError => e
	    render json: {messege: e.message}, status: :unauthorized
    end
    def logout
        current_user.authentication_token = nil
        current_user.save!
        head(:ok)
    rescue StandardError => e
	    render json: {message: e.message}, status: :bad_request
    end

    private

    def user_params
        params.require(:user).permit(:name, :profile_picture)
    end
end
