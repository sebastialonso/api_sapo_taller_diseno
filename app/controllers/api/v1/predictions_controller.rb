module Api
  module V1
    class PredictionsController < ApplicationController
      
      def index
        sapeadas = [
          Sapeada.new(bus_id: 1, user_id: 1, lat: -33.024767, lon: -71.562856, direction: 0, time:34200),
          Sapeada.new(bus_id: 1, user_id: 1, lat: -33.023868, lon: -71.567791, direction: 0, time: 37800),
          Sapeada.new(bus_id: 1, user_id: 1, lat: -33.027322, lon: -71.574958, direction: 0, time: 52200),
          Sapeada.new(bus_id: 1, user_id: 1, lat: -33.029624, lon: -71.587103, direction: 0, time: 55800),
          Sapeada.new(bus_id: 1, user_id: 1, lat: -33.033906, lon: -71.589034, direction: 0, time: 68400),
          Sapeada.new(bus_id: 1, user_id: 1, lat: -33.036101, lon: -71.593283, direction: 0, time: 70200),
        ]
        @prediction = sapeadas.shuffle.first
        render json: @prediction.to_json, status: :ok
      end
      
      private
      def prediction_params
        @model = Predictions.find(params[:id]) if params[:id]
      end
    end
    
  end
  
end