require 'rails_helper'

RSpec.describe "Genders", type: :request do


  describe "GET /genders" do
    it "return all genders" do
      get "/api/v1/genders"

      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /genders" do
    context 'with valid params' do
      it 'creates a new gender' do
        valid_params = {
          gender: {
            name: 'TestGenderName'
          }
        }

        expect {
          post '/api/v1/genders', params: valid_params
        }.to change { Gender.count }.from(0).to(1)

        expect(response).to have_http_status(:created)
        expect(JSON.parse(response.body)).to include(
          {
            'id' => 1,
            'name' => 'TestGenderName',
          }
        )
      end
    end

    context 'with invalid params' do
      it 'does not create a new Gender' do
      invalid_params = {
        gender: {
          name: ''
        }
      }

      expect {
        post '/api/v1/genders', params: invalid_params
      }. to_not change(Gender, :count)
      expect(response).to have_http_status(:unprocessable_entity)

      end    
    end  

  end

end
