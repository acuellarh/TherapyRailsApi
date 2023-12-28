require 'rails_helper'

describe 'Schedule API', type: :request do 
  # ! Is to force the creation, because normally is lazi load
  let!(:first_gender) {FactoryBot.create(:gender, name: 'Male' )}
  let!(:first_relationship) {FactoryBot.create(:relationship, name: 'Amigo' )}
  let!(:first_document_type) {FactoryBot.create(:document_type, name: 'Cedula' )}


  describe 'GET /pacients' do    
    it 'return all pacients' do
      get '/api/v1/pacients'
  
      expect(response).to have_http_status(:success)
    end  
  end


  describe 'POST /pacients' do

    context 'with valid params' do
      it 'create a new pacient' do   
        valid_params =  {
          pacient: {
            gender_id: first_gender.id,
            relationship_id: first_relationship.id,
            document_type_id: first_document_type.id,
            name: 'testName',
            lastname: 'testLasname',
            birthday: '05-06-1982',
            identifier: '1234',
            mobile: '300000000901',
            email: 'prueba1234@gmail.com',
            address: 'Carrera prueba 1234',
            other_contact: 'acompañante 1234',
            other_contact_mobile: '3000000901',
            status: true  
          }
        }

        expect {          
          post '/api/v1/pacients', params: valid_params
        }.to change { Pacient.count }.from(0).to(1)    

        expect(response).to have_http_status(:created)

        expected_birthday = Date.parse('05-06-1982').strftime("%m-%d-%Y")

        expect(JSON.parse(response.body)).to eq(
          {
            'id' => Pacient.last.id,
            'name' => 'testName' ,
            'lastname' => 'testLasname' ,
            'name_complete' => 'testName testLasname' ,
            'birthday' => expected_birthday,
            'identifier' => '1234',
            'document_type' => 'Cedula',
            'mobile' => '300000000901',
            'email' => 'prueba1234@gmail.com',
            'address' => 'Carrera prueba 1234',
            'other_contact' => 'acompañante 1234',
            'other_contact_mobile' => '3000000901',
            'other_contact_pacient_relation' => 'Amigo',
            'status' => true,
            'gender' => 'Male'
          }
        )
      end
    end

    context 'with invalid params' do
      it 'does not create a new Pacient' do
        invalid_params =  {
          pacient: {
            gender_id: first_gender.id,
            relationship_id: first_relationship.id,
            document_type_id: first_document_type.id,
            name: '',       
          }
        }

        expect {
          post '/api/v1/pacients', params: invalid_params
        }.to_not change(Pacient, :count)   
        expect(response).to have_http_status(:unprocessable_entity)      
      end
    end
  end

  describe 'DELETE /pacientes/:id' do

    let!(:pacient) { pacient = FactoryBot.create( :pacient,
        gender_id: first_gender.id,
        relationship_id: first_relationship.id,
        document_type_id: first_document_type.id,
        name: 'PruebaDelete',
        lastname: 'Prueba',
        birthday: '05-06-1982',
        identifier: '85471265',
        mobile: '300000000901',
        email: 'pruebadelete@gmail.com',
        address: 'Carrera prueba delete',
        other_contact: 'acompañante delete',
        other_contact_mobile: '3000000901',
        status: true
    )}

    it 'deletes a pacient' do
      expect {
        delete "/api/v1/pacients/#{pacient.id}"
      }.to change { Pacient.count }.from(1).to(0)
      expect(response).to have_http_status(:no_content)
    end
  end


end