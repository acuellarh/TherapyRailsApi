module Api
  module V1  
    class PacientsController < ApplicationController
      def index
        pacients = Pacient.all
        render json: PacientsRepresenter.new(pacients).as_json
      end
    
      def create
        g = Gender.first
        r = Relationship.first
        d = Document_type.first
    
        pacient = Pacient.new( 
          gender_id: r,
           relationship_id: r,
            document_type_id: d,
             name: 'Alicia',
              lastname: 'Marin Henao',
               birthday: '1982-05-06',
                identifier: '123456789',
                 mobile: '3044757458',
                  email: 'alim@gmail.com',
                   address: 'carrera 2',
                   other_contact: 'Andres Calamaro',
                   other_contact_mobile: '3255412587',
                   status: true
                   )   
    
        if pacient.save
          render json: pacient, status: :created
        else
          render json: pacient.errors, status: :unproccessable_entity
        end
    
      end
    
    end
  end  
end  
