require 'rails_helper'

RSpec.describe "Relationships", type: :request do


  describe "GET /relationships" do
    it "return all relationships" do
      get "/api/v1/relationships"

      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /relationships" do
    context 'with valid params' do
      it 'creates a new relationship' do
        valid_params = {
          relationship: {
            name: 'TestRelationshipName'
          }
        }

        expect {
          post '/api/v1/relationships', params: valid_params
        }.to change { Relationship.count }.from(0).to(1)

        expect(response).to have_http_status(:created)
        expect(JSON.parse(response.body)).to include(
          {
            'id' => 5,
            'name' => 'TestRelationshipName'
          }
        )
      end
    end

    context 'with invalid params' do
      it 'does not create a new Relationship' do
      invalid_params = {
        relationship: {
          name: ''
        }
      }

      expect {
        post '/api/v1/relationships', params: invalid_params
      }. to_not change(Relationship, :count)
      expect(response).to have_http_status(:unprocessable_entity)

      end    
    end  

  end

end
