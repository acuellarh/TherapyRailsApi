require 'rails_helper'

describe 'Schedule API', type: :request do 
  # ! Is to force the creation, because normally is lazi load
  let!(:first_product_category) {FactoryBot.create(:product_category, name: "Consulta diagnostica", description: "Consulta" )}
  
  describe 'GET /products' do    
    it 'return all products' do
      get '/api/v1/products'

      expect(response).to have_http_status(:success)
    end  
  end

  describe 'POST /products' do

    context 'with valid params' do
      it 'create a new product' do   
        valid_params =  {
          product: {
            name: 'testName',
            price: 10000,
            quantity: 1,
            status: true,
            product_category_id: first_product_category.id
          }
        }

        expect {          
          post '/api/v1/products', params: valid_params
        }.to change { Product.count }.from(0).to(1)    

        expect(response).to have_http_status(:created)
        expect(JSON.parse(response.body)).to eq(
          {
            'id' => Product.last.id,
            'name' => 'testName' ,
            'price' => 10000,
            'quantity' => 1 ,
            'status' => true,
            'product_category_id' => 3,
            'product_category_name' => 'Consulta diagnostica'            
          }
        )
      end
    end

    context 'with invalid params' do
      it 'does not create a new product' do
        invalid_params =  {
          product: {
            name: '',
            price: 10000,
            quantity: 1,
            status: true,
            product_category_id: first_product_category.id
          }
        }

        expect {
          post '/api/v1/products', params: invalid_params
        }.to_not change( Product, :count )   
        expect(response).to have_http_status(:unprocessable_entity)      
      end
    end

  end

end

