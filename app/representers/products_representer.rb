class ProductsRepresenter
  def initialize(products)
    @products = products
  end  

  def as_json
    products.map do |product|    
      {
        id: product.id,
        name: product.name,
        price: product.price,
        quantity: product.quantity,
        status: product.status, 
        product_category_id: product.product_category_id,
        product_category_name: product.product_category.name 
      }
    end
  end  

  private

  attr_reader :products

end