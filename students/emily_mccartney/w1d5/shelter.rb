class Shelter 
   attr_accessor :shelter_name, :animals, :shelter_description, :clients

   def initialize(shelter_name)
    @shelter_name = shelter_name
    @animals =[]
    @shelter_description = shelter_description
    @clients = []
  end

  def animal_list
    animals.join(',')
  end

end 