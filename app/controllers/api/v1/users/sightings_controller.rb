module Api
  module V1
    module Users
      class SightingsController < ApplicationController

        def index
          @sapeadas = Sighting.where(user_id: params[:user_id]).order("ASCD created_at").limit(5)
        end
      end      
    end
  end  
end