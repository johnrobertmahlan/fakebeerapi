module Api 
  module V1 
    class BreweriesController < ApplicationController

      def index
        @breweries = Brewery.all 

        render json: { status: 'Success', message: 'Here are all the breweries in our system.', data: @breweries}, status: :ok
      end

      def show
      end

      def create 
      end

      def update
      end

      def destroy
      end

    end
  end
end
