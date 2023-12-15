class ProductRepresenter
  
  def initialize(product)
    @product = product
  end  

  def as_json
    {
      id: product.id,
      product_category_id: product.product_category_id,
      name: product.name,
      price: price
      birthday: product.birthday 
    }
  end  

  private

  attr_reader :product

  def product_name(product)
    "#{product.name} #{product.lastname}"        
  end

end
