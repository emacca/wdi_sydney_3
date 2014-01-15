require 'pry'
require 'pry-debugger'

require_relative "animal"
require_relative "shelter"
require_relative "client"

animal1 = Animal.new #("monkey","chimps",2,"male",["ball","bark","stick"])
animal1.name = "monkey"
animal1.petsname = "chimps"
animal1.a_age = 2
animal1.gender = "male"
animal1.toys = ["ball", "bark","stick"]

animal2 = Animal.new
animal2.name = "turtle"
animal2.petsname = "jack"
animal2.a_age = 2
animal2.gender = "male"
animal2.toys = ["bark","stick"]

client1 = Client.new
client1.name = "emily"
client1.children = 4
client1.age = 22
client1.numpets = 2
client1.pets = []


newshelter= Shelter.new("HapiTails")
newshelter.clients << client1
newshelter.animals << animal1 << animal2
  

puts "Welcome to #{newshelter.shelter_name} Animal Shelter"
loop do 
#shelter will display the count of anaimals and the count of clients 
puts "Here at #{newshelter.shelter_name} we have #{newshelter.animals.count} animals and have #{newshelter.clients.count} clients."
puts "-----------------"
puts "Choose what you want to do?"
puts "1. Create a client"  
puts "2. Create an animal" 
puts "3. Look at clients"
puts "4. Look at animals"
puts "5. adopt an animal"
puts "6. put animals up for adoption" 
puts "----------------"
puts "To exit type --- q"
client_command = gets.chomp.downcase


if client_command == "1"
  puts "what is your name?"
  c_name = gets.chomp.downcase

  puts "how many children do you have?"
  c_children = gets.chomp.to_i

  puts "How old are you?"
  c_age = gets.chomp.to_i
  
  puts "How many pets do you have?"
  c_num_pets = gets.chomp.to_i

  puts "what are your pets names?"
  c_pets = gets.chomp.downcase

  client_create = Client.new
  client_create.name = c_name
  client_create.children = c_children
  client_create.age = c_age
  client_create.numpets = c_num_pets
  client_create.pets = c_pets

  newshelter.clients.push(client_create)

elsif client_command == "2"
  puts "what animal do you want to add?"
  a_name = gets.chomp.downcase

  puts "what is your pets name?"
  pets_name = gets.chomp.downcase

  puts "How old is #{pets_name}?"
  a_age = gets.chomp.to_i

  puts "Is you pet male or female?"
  a_gender = gets.chomp.downcase

  puts "What toys does your #{pets_name} have?"
  a_toys = gets.chomp.downcase

  animal_create = Animal.new
  animal_create.name = a_name
  animal_create.petsname = pets_name
  animal_create.a_age = a_age
  animal_create.gender = a_gender
  animal_create.toys = a_toys

  newshelter.animals.push(animal_create)

elsif client_command == "3"
  puts newshelter.clients.map{|client| client.name}

  puts "what client do you want to see?"
  clients_information = gets.chomp.downcase

  client_listing = newshelter.clients.find{|client| client.name == clients_information }

  puts client_listing

 elsif client_command == "4"
  puts newshelter.animals.map{|animal| animal.name}

  puts "What animal do you want to see?"
  animal_information = gets.chomp.downcase

  animal_listing = newshelter.animals.find{|animal| animal.name == animal_information }

  puts animal_listing


elsif client_command == "5"
  puts "What client wants to adopt?"
  client_names = gets.chomp.downcase
  client = newshelter.clients.find{|client| client.name == client_names}
  # puts client_names
  

  puts "What animal would you like to adopt?"
  animal_names = newshelter.animals.map{|animal| animal.name}
  puts animal_names
  user_adopt = gets.chomp.downcase

  animal_delete = newshelter.animals.find {|animal| user_adopt == animal.name} #find
  user_adopt = newshelter.animals.delete(animal_delete)#pass it in to delete

  client.pets << user_adopt

elsif client_command == "6"
  puts "What client is wanting to do?"
  client_names = gets.chomp.downcase
  client = newshelter.clients.find{|client| client.name == client_names}

  puts "your animals do you want to put up for adoption?"
  puts client.pets.map{|pet| pet.name}

  puts "choose the pet"
  pet_choice = gets.chomp.downcase
  
  pet_to_adopt = client.pets.find{|pet| pet.name == pet_choice}
  adopted_pet = client.pets.delete(pet_to_adopt)

  newshelter.animals << adopted_pet

elsif client_command == "q"
  
else
  puts "*************"
  puts "Please enter in a valid option"
  puts "*************"

end
break if client_command == "q"

end



    



