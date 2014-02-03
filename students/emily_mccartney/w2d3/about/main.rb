require "sinatra"
require "sinatra/reloader" if development?
require "pony"

get "/" do
erb :index
end

get "/about" do
erb :about
end

get "/students/pranava" do
erb :"/students/pranava"
end

get "/students/alberto" do
erb :"/students/alberto"
end

get "/students/emily" do
erb :"students/emily"
end

get "/students/luke" do
erb :"/students/luke"
end

get "/contact" do
erb :contact
end

get "/success" do 
erb :success
end

post "/contact" do

  options = {
      :to => 'emily.mccartney@students.mq.edu.au',
      :from => params[:email],
      :subject => params[:name],
      :body => params[:message],
      :via => :sendmail,
      :via_options => {
        :address => 'smtp.gmail.com',
        :port => 587,
        :enable_starttls_auto => true,
        :user_name => 'emily.mccartney@students.mq.edu.au',
        :password => '09028macca',
        :authentication => :plain,
        :domain => 'gmail.com'
      }
    }

    Pony.mail(options)
redirect "/success"

end

not_found do
  status 404
  'This is nowhere to be found.'
  erb :opps
end