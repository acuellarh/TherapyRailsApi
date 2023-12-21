module Api
  module V1
    class DocumentTypesController < ApplicationController
      
      def index
        document_types = DocumentType.all
        render json: DocumentTypesRepresenter.new(document_types).as_json
      end 
          
      def create
       document_type = DocumentType.new(document_type_params)     
        
        if document_type.save
          #binding.irb
          render json: document_type, status: :created
        else
          render json: document_type.errors.full_messages, status: :unprocessable_entity
        end    
      end

      private

      def document_type_params
        params.require(:document_type).permit(:name)        
      end

    end
  end    
end  