require 'rails_helper'

RSpec.describe "ProductCategories", type: :request do


  describe "GET /product_categories" do
    it "return all product_categories" do
      get "/api/v1/product_categories"

      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /product_categories" do
    context 'with valid params' do
      it 'creates a new product_category' do
        valid_params = {
          product_category: {
            name: 'TestProductCategoryName',
            description: 'TestDescription'
          }
        }

        expect {
          post '/api/v1/product_categories', params: valid_params
        }.to change { ProductCategory.count }.from(0).to(1)

        expect(response).to have_http_status(:created)
        expect(JSON.parse(response.body)).to include(
          {
            'id' => 1,
            'name' => 'TestProductCategoryName',
            'description' => 'TestDescription',
          }          
        )
      end
    end

    context 'with invalid params' do
      it 'does not create a new ProductCategory' do
      invalid_params = {
        product_category: {
          name: 'TestProductCategoryName',
          description: ''
        }
      }

      expect {
        post '/api/v1/product_categories', params: invalid_params
      }. to_not change(ProductCategory, :count)
      expect(response).to have_http_status(:unprocessable_entity)

      end    
    end  

  end

end
