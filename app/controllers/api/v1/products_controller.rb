module Api
  module V1  
    class ProductsController < ApplicationController
      def index
        products = Product.all
<<<<<<< HEAD
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
=======
        #render json: ProductsRepresenter.new(products).as_json
        render json: products
      end
    
      def create

        product = Product.new(product_params)     
        
        if product.save
          #binding.irb
          #render json: ProductRepresenter.new(product).as_json, status: :created
          render json: product
        else
          render json: product.errors.full_messages, status: :unprocessable_entity
        end
    
      end

      # def update 
      # product = Product.find(params[:id])

      #   if product.update(product_params)
      #     render json: ProductRepresenter.new(product).as_json, status: :ok       
      #   else
      #     render json: product.errors.full_messages, status: :unprocessable_entity
      #   end

      # end

      # def destroy
      #    Product.find(params[:id]).destroy!
         
      #    head :no_content
      # end


>>>>>>> cd2d22045b35b86ab26cc61f543baf191d2309e6

      private

      def product_params
<<<<<<< HEAD
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
=======
        params.require(:product).permit(  
          :name,
          :price,
          :quanqity,
          :status,
          :product_category_id    
        )        
      end
    
    end
  end  
end  
>>>>>>> cd2d22045b35b86ab26cc61f543baf191d2309e6
