require 'pry'
require 'sinatra'
require 'pry-debugger'
require 'sinatra/reloader' if development?
require 'active_support/all'
require 'pg'
require 'active_record'
require 'date'

ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :database => "animal_shelter"
)

class Shelter < ActiveRecord::Base
  has_many :animals
  has_many :clients
end

class Animal < ActiveRecord::Base
  belongs_to :clients
  belongs_to :shelter
end

class Client < ActiveRecord::Base
  has_many :animals
  belongs_to :shelter
end

#print out the list of shelters on the home page 
get '/' do
  @shelters = Shelter.all
  erb :home
end

get '/shelters/:id' do
  if params[:sort].present?
    @shelter = Shelter.find(params[:id])
    @animals = @shelter.animals.order(params[:sort]).all
  elsif 
    @shelter = Shelter.find(params[:id])
    @animals = @shelter.animals.order("species DESC").all
  else
    @shelter = Shelter.find(params[:id])
    @animals = @shelter.animals.order("date_time DESC").all
  end
 
  erb :shelter
end

get '/shelters/:shelter_id/animals/:animal_id' do
  @shelter = Shelter.find(params[:shelter_id])
  @animal = @shelter.animals.find(params[:animal_id])
  
  erb :animals
end

post '/shelters/:shelter_id/animals/donate' do
  @new_animal = Animal.new(:name => params[:name], :age => params[:age], :gender => params[:gender], :shelter_id => params[:shelter_id], :date_time => Time.now, :species => params[:species], :breed => params[:breed])
  if Animal.count <= @new_animal.shelter.max_capacity
    @shelters = Shelter.all
    
    erb :fullshelter

  else  @new_animal.save
    redirect to "/shelters/#{params[:shelter_id]}"
    
  end
end

get '/shelters/:shelter_id/animals' do
  @shelter = Shelter.find(params[:shelter_id])
  @animals = @shelter.animals
  @new_animal = Animal.new
  erb :donate
end

delete '/shelters/:shelter_id/animals/:animal_id' do
  delete_animal = Animal.find("#{params[:animal_id]}")
  delete_animal.delete
  redirect to "/shelters/#{params[:shelter_id]}"
end