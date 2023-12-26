module Api
  module V1
    class ProductCategoriesController < ApplicationController
      
      def index
        product_categories = ProductCategory.all
        render json: ProductCategoriesRepresenter.new(product_categories).as_json
      end
          
      def create
       product_category = ProductCategory.new(product_category_params)     
        
        if product_category.save
          #binding.irb
          render json: product_category, status: :created
        else
          render json: product_category.errors.full_messages, status: :unprocessable_entity
        end    
      end

      def destroy
        ProductCategory.find(params[:id]).destroy!
        
        head :no_content
      end

      def update 
       product_category = ProductCategory.find(params[:id])

        if product_category.update(product_category_params)
          render json: product_category 
        else
          render json: product_category.errors.full_messages, status: :unprocessable_entity
        end

      end

      private

      def product_category_params
        params.require(:product_category).permit(
            :name,
            :description
          )        
      end

    end
  end    
end  

