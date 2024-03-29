require 'rails_helper'

describe 'Schedule API', type: :request do 
  # ! Is to force the creation, because normally is lazi load
  let!(:first_product_category) {FactoryBot.create(:product_category, name: "Consulta diagnostica", description: "Consulta" )}
<<<<<<< HEAD
  
  describe 'GET /products' do    
    it 'return all products' do
      get '/api/v1/products'

=======

  describe 'GET /products' do    
    it 'return all products' do
      get '/api/v1/products'
  
>>>>>>> cd2d22045b35b86ab26cc61f543baf191d2309e6
      expect(response).to have_http_status(:success)
    end  
  end

<<<<<<< HEAD
=======

>>>>>>> cd2d22045b35b86ab26cc61f543baf191d2309e6
  describe 'POST /products' do

    context 'with valid params' do
      it 'create a new product' do   
        valid_params =  {
          product: {
            name: 'testName',
            price: 10000,
<<<<<<< HEAD
            quantity: 1,
=======
            quanqity: 1,
>>>>>>> cd2d22045b35b86ab26cc61f543baf191d2309e6
            status: true,
            product_category_id: first_product_category.id
          }
        }

        expect {          
          post '/api/v1/products', params: valid_params
        }.to change { Product.count }.from(0).to(1)    

        expect(response).to have_http_status(:created)
<<<<<<< HEAD
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
=======
        # expect(JSON.parse(response.body)).to eq(
        #   {
        #     'id' => Product.last.id,
        #     'name' => 'testName' ,
        #     'lastname' => 'testLasname' ,
        #     'name_complete' => 'testName testLasname' ,
        #     'birthday' => '1982-05-06',
        #     'identifier' => '1234',
        #     'document_type' => 'Cedula',
        #     'mobile' => '300000000901',
        #     'email' => 'prueba1234@gmail.com',
        #     'address' => 'Carrera prueba 1234',
        #     'other_contact' => 'acompañante 1234',
        #     'other_contact_mobile' => '3000000901',
        #     'other_contact_product_relation' => 'Amigo',
        #     'status' => true,
        #     'gender' => 'Male'
        #   }
        # )
>>>>>>> cd2d22045b35b86ab26cc61f543baf191d2309e6
      end
    end

    context 'with invalid params' do
<<<<<<< HEAD
      it 'does not create a new product' do
        invalid_params =  {
          product: {
            name: '',
            price: 10000,
            quantity: 1,
            status: true,
            product_category_id: first_product_category.id
=======
      it 'does not create a new Product' do
        invalid_params =  {
          product: {
            gender_id: first_gender.id,
            relationship_id: first_relationship.id,
            document_type_id: first_document_type.id,
            name: '',       
>>>>>>> cd2d22045b35b86ab26cc61f543baf191d2309e6
          }
        }

        expect {
          post '/api/v1/products', params: invalid_params
<<<<<<< HEAD
        }.to_not change( Product, :count )   
        expect(response).to have_http_status(:unprocessable_entity)      
      end
    end

  end

end

=======
        }.to_not change(Product, :count)   
        expect(response).to have_http_status(:unprocessable_entity)      
      end
    end
  end

  # describe 'DELETE /productes/:id' do

  #   let!(:product) { product = FactoryBot.create( :product,
  #       gender_id: first_gender.id,
  #       relationship_id: first_relationship.id,
  #       document_type_id: first_document_type.id,
  #       name: 'PruebaDelete',
  #       lastname: 'Prueba',
  #       birthday: '1982-05-06',
  #       identifier: '85471265',
  #       mobile: '300000000901',
  #       email: 'pruebadelete@gmail.com',
  #       address: 'Carrera prueba delete',
  #       other_contact: 'acompañante delete',
  #       other_contact_mobile: '3000000901',
  #       status: true
  #   )}

  #   it 'deletes a product' do
  #     expect {
  #       delete "/api/v1/products/#{product.id}"
  #     }.to change { Product.count }.from(1).to(0)
  #     expect(response).to have_http_status(:no_content)
  #   end
  # end


end
>>>>>>> cd2d22045b35b86ab26cc61f543baf191d2309e6
