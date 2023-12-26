module Api
  module V1  
    class ProductsController < ApplicationController
      def index
        products = Product.all
        render json: ProductsRepresenter.new(products).as_json      
      end

      def create

        product = Product.new(product_params)     

        if product.save
          #binding.irb
          render json: ProductRepresenter.new(product).as_json, status: :created
        else
          render json: product.errors.full_messages, status: :unprocessable_entity
        end

      end

      def destroy
        Product.find(params[:id]).destroy!
        
        head :no_content
     end

      private

      def product_params
        params.require(:product).permit(
          :name, 
          :price,
          :quantity,
          :status,
          :product_category_id
        )        
      end

    end
  end  
end  