class ProductRepresenter
<<<<<<< HEAD
=======
  
>>>>>>> cd2d22045b35b86ab26cc61f543baf191d2309e6
  def initialize(product)
    @product = product
  end  

<<<<<<< HEAD
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
=======
  def as_json
    {
      id: product.id,
      product_category_id: product.product_category_id,
      name: product.name,
      price: price
      birthday: product.birthday 
    }
>>>>>>> cd2d22045b35b86ab26cc61f543baf191d2309e6
  end  

  private

  attr_reader :product

<<<<<<< HEAD
end
=======
  def product_name(product)
    "#{product.name} #{product.lastname}"        
  end

end
>>>>>>> cd2d22045b35b86ab26cc61f543baf191d2309e6
