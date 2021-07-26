module Api 
  module V1 
    class BreweriesController < ApplicationController
      rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
      rescue_from ActiveRecord::RecordNotDestroyed, with: :record_not_destroyed
      
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
        @brewery = Brewery.create(brewery_params)

        if @brewery.save
          render json: { status: 'Success', message: 'Thanks for adding a new brewery!', data: @brewery }, status: :created
        else
          render json: { status: 'Fail', message: 'We cannot add that brewery at this time', data: {} }, status: :unprocessable_entity
        end
      end

      def update
        @brewery = Brewery.find(params[:id])
        @brewery.update(brewery_params)

        render json: { status: 'Success', message: 'That brewery has now been updated!', data: @brewery }, status: :created
      end

      def destroy
        @brewery = Brewery.find(params[:id])
        @brewery.destroy!

        render json: {}, status: :no_content
      end

      private

      def brewery_params
        params.require(:brewery).permit(:name, :state)
      end

      def record_not_found
        render json: { status: 'Fail', message: 'Cannot find what you want' }, status: :no_content
      end

      def record_not_destroyed
        head: :no_content
      end
    end
  end
end
