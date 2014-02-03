require "sinatra"
require "sinatra/reloader" if development?
require "httparty"
# require "active_support/all"

before do 
    movie_history_array = File.open("history.csv", "r") do |f|
        f.readlines.map{|row| row.comp.split(", ")}
    end

    @movie_history = {}
    movie_history_array.each do |movie|
        @movie_history[movie[0]] = {
            'Title' => movie[0],
            'Poster' => movie[1]
        }
    end
end

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
  movie_name = params[:movie]

  if !params[:movie_title].nil? && !params[:movie_title].empty?
    @movie_data = {}
    start_url = "http://www.omdbapi.com/?t="
    movie_name = params[:movie_title].gsub(" ","+")
    complete_url = (start_url + movie_name)
    @movieinfo = HTTParty.get(complete_url)
    @movie_data = JSON[@movieinfo]

    @movie_history[movie_name] = @movie
    File.open("history.csv", "a") do |file|
        file.puts "#{@movie['Title']}, #{@movie['Poster']}"
    end
  else
    @movie = @movie_history[movie_name]

 end
  
erb :movies
end

get "/history" do 
    # f = File.new("history.txt", "w")
    # f.params[:movie]
    # f.close

    # f = File.new("history.txt","r")
    # f.readlines
    # f.close

erb :history
end


