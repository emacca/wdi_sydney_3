require "sinatra"
require "sinatra/reloader" if development?
require "httparty"
# require "active_support/all"


get "/" do
  

  if !params[:movie].nil? && !params[:movie].empty?
    @movie_list = {}
    start_url = "http://www.omdbapi.com/?s="
    movie_name = params[:movie].gsub(" ","+")
    complete_url = (start_url + movie_name)
    @movieinfo = HTTParty.get(complete_url)
    @movie_list = JSON[@movieinfo]

 end
  
erb :movies
end
=begin
This is my selecting of a title in the hash,
it is assigned to the page /movie and then/ it passes in 
the movie title that the user has put into the search form.
=end

get "/movies/:movie_title" do
  

  if !params[:movie_title].nil? && !params[:movie_title].empty?
    @movie_data = {}
    start_url = "http://www.omdbapi.com/?t="
    movie_name = params[:movie_title].gsub(" ","+")
    complete_url = (start_url + movie_name)
    @movieinfo = HTTParty.get(complete_url)
    @movie_data = JSON[@movieinfo]

 end
  
erb :movies
end