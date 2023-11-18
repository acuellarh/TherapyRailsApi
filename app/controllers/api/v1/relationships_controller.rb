module Api
  module V1
    class RelationshipsController < ApplicationController
      
      def index
        relationships = Relationship.all
        render json: RelationshipsRepresenter.new(relationships).as_json
      end

          
      def create
       relationship = Relationship.new(relationships_params)     
        
        if relationship.save
          #binding.irb
          render json: relationship, status: :created
        else
          render json: relationship.errors.full_messages, status: :unprocessable_entity
        end    
      end

      private

      def relationships_params
        params.require(:relationship).permit(:name)        
      end

    end
  end    
end  
