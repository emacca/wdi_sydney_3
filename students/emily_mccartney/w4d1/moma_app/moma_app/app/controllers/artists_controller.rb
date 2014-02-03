class ArtistsController < ApplicationController
  
  #lisitng all the aritsts - get 
  def index 
    @artists = Artist.all
  end

  #show the artist and the details, shows a single artist.
  def show 
    @artist = Artist.find(params[:id])
    @paintings = @artist.paintings
  end 

  #new artist - the form
  def new 
    @artist = Artist.new
  end 

  #creating a new artist and then redirecting
  def create 
    artist = Artist.create(artist_params)
    redirect_to artist #rails knows to go to the show page you need to just reference the correct object
  end 


  def edit 
    @artist = Artist.find(params[:id])#find the existing one
  end 

  #updating a record, choose the aritst, then update and then redirect
  def update
    artist = Artist.find(params[:id])
    artist.update_attributes(artist_params)
    redirect_to artist
  end 


  def destroy
    artist = Artist.find(params[:id])
    artist.destroy
    redirect_to artists_path #takes us back to the index
  end 

  #you need this to let you use the create method and you pass in the fields that you allow, leave the others out like password
  def artist_params
    params.require(:artist).permit(:name,:period,:nationality,:dob,:image)
  end

end
