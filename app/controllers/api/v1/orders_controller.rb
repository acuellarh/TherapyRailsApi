module Api
  module V1
    class OrdersController < ApplicationController
      
      def index
        orders = Order.all       
        render json: OrdersRepresenter.new(orders).as_json
      end

          
      def create
        order = Order.new(order_params)     
        
        if order.save
          #binding.irb
          render json: order, status: :created
        else
          render json: order.errors.full_messages, status: :unprocessable_entity
        end    
      end

      private

      def order_params     
        params.require(:order).permit(
          :pacient_id,
          :order_status_type_id         
        )        
      end

    end
  end    
end  
