class DocumentTypesRepresenter
  def initialize(document_types)
    @document_types = document_types    
  end

  def as_json
    document_types.map do |document_type|
      {
        id: document_type.id,
        name: document_type.name
      }
    end
  end
  
  private 

  attr_reader :document_types

end  