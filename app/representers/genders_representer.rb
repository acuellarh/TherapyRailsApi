class GendersRepresenter
  def initialize(genders)
    @genders = genders    
  end

  def as_json
    genders.map do |gender|
      {
        id: gender.id,
        name: gender.name
      }
    end
  end
  
  private 

  attr_reader :genders

end  