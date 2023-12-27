class ProductRepresenter
  def initialize(product)
    @product = product
  end  

  def as_json     
    {
      id: product.id,
      name: product.name,
      price: product.price.to_i,
      quantity: product.quantity.to_i,
      status: product.status, 
      product_category_id: product.product_category_id,
      product_category_name: product.product_category.name 
    }    
  end  

  private

  attr_reader :product

end