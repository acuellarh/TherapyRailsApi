module Api
  module V1
    class GendersController < ApplicationController
      
      def index
        genders = Gender.all
        render json: GendersRepresenter.new(genders).as_json
      end

          
      def create
       gender = Gender.new(gender_params)     
        
        if gender.save
          #binding.irb
          render json: gender, status: :created
        else
          render json: gender.errors.full_messages, status: :unprocessable_entity
        end    
      end

      private

      def gender_params
        params.require(:gender).permit(:name)        
      end

    end
  end    
end  

