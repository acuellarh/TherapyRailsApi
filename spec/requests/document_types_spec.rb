require 'rails_helper'

RSpec.describe "DocumentTypes", type: :request do


  describe "GET /document_types" do
    it "return all document_types" do
      get "/api/v1/document_types"

      expect(response).to have_http_status(:success)
    end
  end

  # describe "POST /document_types" do
  #   context 'with valid params' do
  #     it 'creates a new document_type' do
  #       valid_params = {
  #         document_type: {
  #           name: 'TestDocumentTypeName'
  #         }
  #       }

  #       expect {
  #         post '/api/v1/document_types', params: valid_params
  #       }.to change { Document_type.count }.from(0).to(1)

  #       expect(response).to have_http_status(:created)
  #       expect(JSON.parse(response.body)).to include(
  #         {
  #           'id' => 1,
  #           'name' => 'TestDocumentTypeName',
  #         }
  #       )
  #     end
  #   end

  #   context 'with invalid params' do
  #     it 'does not create a new Document_type' do
  #     invalid_params = {
  #       document_type: {
  #         name: ''
  #       }
  #     }

  #     expect {
  #       post '/api/v1/document_types', params: invalid_params
  #     }. to_not change(Document_type, :count)
  #     expect(response).to have_http_status(:unprocessable_entity)

  #     end    
  #   end  

  # end

end
