module Api
  module V1
    class SightingsController < ApplicationController

      def create
        @sighting = Sighting.new sighting_params
        if @sighting.save
          render json: {}, status: :created
        else
          render json: @sighting.errors.to_json, status: :unprocessable_entity
        end
      end

      private
      def sighting_params
        params.require(:sighting).permit(:lat, :lon, :time, :direction, :bus_id, :user_id)
      end
    end
  end
end