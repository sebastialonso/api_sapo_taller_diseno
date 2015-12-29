module Api
  module V1
    module Users
      class SessionsController < ApplicationController

        def create
          @user = User.find_by(email: user_params[:email])
          if @user.nil?
            facebook_data = view_context.authorized(user_params[:token])
            if facebook_data["id"] == user_params[:face_id]
              user = User.new(email: user_params[:email], name: facebook_data["name"])
              if user.save
                render json: user.to_json, status: :created
              else
                render json: { error: 'A problem happened.Try again later' }, status: :unprocessable_entity
              end
            else
              render json: { error: "You're cheating" }, status: :unauthorized
            end
          else
            render json: @user.to_json , status: :ok
          end
        end
        
      
        private
        def user_params
          params.require(:user).permit(:token, :face_id, :email)
        end
      end
      
    end
    
  end
  
end