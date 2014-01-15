class Client

  attr_accessor :name, :children, :age, :numpets, :pets

  def initialize(name=nil, children=nil, age=nil, numpets=nil, pets=[])
    @name = name 
    @children = children
    @age = age
    @numpets = numpets
    @pets = pets
  end 
  def to_s
    "The Clients name is #{@name}. You have #{@children} children. You are #{@age} years old. You have #{numpets} pets and their name(s) are #{@pets.map{|pet|pet.name}}."
  end 
end 