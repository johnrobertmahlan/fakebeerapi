module Api 
  module V1 
    class BreweriesController < ApplicationController

      def index
        if params.has_key?("name")
          name = params[:name].split(/_/).map {|s| s.capitalize}.join(" ") 
          @brewery = Brewery.find_by(name: name)
          if !@brewery.nil? 
            render json: { status: 'Success', message: 'You found it!', data: @brewery }, status: :ok
          else
            render json: { status: 'Fail', message: 'There are no breweries with that name' }, status: :unprocessable_entity
          end
        else 
          @breweries = Brewery.all 

          render json: { status: 'Success', message: 'Here are all the breweries in our system.', data: @breweries }, status: :ok
        end
      end

      def show
        @brewery = Brewery.find(params[:id])

        render json: { status: 'Success', message: 'Here is the brewery you were looking for.', data: @brewery }, status: :ok
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
