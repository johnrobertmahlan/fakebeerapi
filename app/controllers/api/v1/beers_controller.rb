module Api
  module V1
    class BeersController < ApplicationController
      
      def index
        @beers = Brewery.find(params[:brewery_id]).beers

        render json: { status: 'Success', message: 'Here are the beers from that brewery!', data: @beers }, status: :ok
      end

      def show
        @beer = Brewery.find(params[:brewery_id]).beers.find(params[:id])

        render json: { status: 'Success', message: 'Here is that beer from that brewery!', data: @beer }, status: :ok
      end
    end
  end
end