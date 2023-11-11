require 'rails_helper'

#describe 'Schedule API', type: :request do 
#RSpec.describe Api::V1::PacientsController, type: :controller do
describe 'Schedule API', type: :controller do 


  describe 'GET /pacients' do    
    it 'return all pacients' do
      get '/api/v1/pacients'
  
      expect(response).to have_http_status(:success)
    end  
  end

  # describe 'POST /pacients' do
  #   it 'create a new pacient' do
  #     post '/api/v1/books', params: {
        
  #     }
  #   end
  # end

end