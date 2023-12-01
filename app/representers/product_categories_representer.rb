class ProductCategoriesRepresenter
  def initialize(product_categories)
    @product_categories = product_categories    
  end

  def as_json
    product_categories.map do |product_category|
      {
        id: product_category.id,
        name: product_category.name,
        description: product_category.description
      }
    end
  end
  
  private 

  attr_reader :product_categories

end  