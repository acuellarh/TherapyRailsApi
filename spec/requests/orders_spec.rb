require 'rails_helper'

describe "Orders", type: :request do
  # ! Is to force the creation, because normally is lazi load
  let!(:first_gender) { FactoryBot.create(:gender, name: 'Male') }
  let!(:first_relationship) { FactoryBot.create(:relationship, name: 'Amigo') }
  let!(:first_document_type) { FactoryBot.create(:document_type, name: 'Cedula') }
  let!(:first_order_status_type) { FactoryBot.create(:order_status_type, name: 'Abierto')}

  describe "GET /orders" do
    it "return all orders" do
      get "/api/v1/orders"
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /orders" do   

    let!(:test_patient) { FactoryBot.create(:pacient,
      gender_id: first_gender.id,
      relationship_id: first_relationship.id,
      document_type_id: first_document_type.id,
      name: 'testName',
      lastname: 'testLasname',
      birthday: '1982-05-06',
      identifier: '1234',
      mobile: '300000000901',
      email: 'prueba1234@gmail.com',
      address: 'Carrera prueba 1234',
      other_contact: 'acompañante 1234',
      other_contact_mobile: '3000000901',
      status: true
    )}

    context 'with valid params' do
      it 'creates a new order' do
        valid_params = {
          order: {
            pacient_id: test_patient.id,
            order_status_type_id: first_order_status_type.id
          }
        }

        post '/api/v1/orders', params: valid_params
        expect(response).to have_http_status(:created)
       
      end
    end

 
  end


end
