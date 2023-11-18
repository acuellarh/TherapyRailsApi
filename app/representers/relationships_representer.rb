class RelationshipsRepresenter
  def initialize(relationships)
    @relationships = relationships    
  end

  def as_json
    relationships.map do |relationship|
      {
        id: relationship.id,
        name: relationship.name
      }
    end
  end
  
  private 

  attr_reader :relationships

end  