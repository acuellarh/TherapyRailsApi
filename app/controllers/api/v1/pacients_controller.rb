module Api
  module V1  
    class PacientsController < ApplicationController
      def index
        pacients = Pacient.all
        render json: PacientsRepresenter.new(pacients).as_json
      end
    
      def create

        pacient = Pacient.new(pacient_params)     
        
        if pacient.save
          #binding.irb
          render json: PacientRepresenter.new(pacient).as_json, status: :created
        else
          render json: pacient.errors.full_messages, status: :unprocessable_entity
        end
    
      end

      def update 
      pacient = Pacient.find(params[:id])

        if pacient.update(pacient_params)
          render json: PacientRepresenter.new(pacient).as_json, status: :ok       
        else
          render json: pacient.errors.full_messages, status: :unprocessable_entity
        end

      end

      def destroy
         Pacient.find(params[:id]).destroy!
         
         head :no_content
      end



      private

      def pacient_params
        params.require(:pacient).permit(
          :gender_id,
          :relationship_id,
          :document_type_id,
          :name,
          :lastname,
          :birthday,
          :identifier,
          :mobile,
          :email,
          :address,
          :other_contact,
          :other_contact_mobile,
          :status      
        )
        
      end
    
    end
  end  
end  
