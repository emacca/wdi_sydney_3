class Animal

  attr_accessor :name, :a_age, :petsname, :gender, :toys

  def initialize(name=nil, petsname=nil, a_age=nil, gender=nil, toys =[])
    @name = name
    @petsname = petsname
    @a_age = a_age
    @gender = gender
    @toys = toys  
  end

  def to_s
    "The animal is a #{@name} their name is #{petsname}. The age is #{@a_age}. The gender is #{@gender}. The toys are #{@toys}."
  end
end
