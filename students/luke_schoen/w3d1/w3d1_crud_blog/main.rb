# ruby mainrb
# localhost:4567

require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'active_support/all'
require 'pg'

# if use a 'before do' block - everytime before every route perform these actions

get '/' do
# in homepage if want list of gets
	sql = "SELECT * FROM blog_posts ORDER BY id;"
# want result to be available in views so use instance variable
	@res = run_sql(sql)	
	erb :_menu_sub_display
end

get '/_menu_sub_create' do
# show the actual form
# _menu_sub_create.erb
	erb :_menu_sub
end

get '/post/:id/_content' do
# if user go to this route it should show the form again
# links for each must be shown in the home.erb, so if user clicks link it will go to page of anchor
	sql = "SELECT * FROM blog_posts WHERE id=#{params[:id]};"
	@records = run_sql(sql) # returns a list of records 
	@blog = @records[0] # @blog is actually a collection in sql
	erb :_content
end

post '/posts/:id' do
#another route to do the updates to an individual cat's record
#first you need the sql
	redirect to '/'
end

# new route to create and save to database
post '/_menu_sub_create' do
	sql = "INSERT INTO blog_posts (title, abstract, body_text, author) values ('#{params[:title]}', '#{params[:abstract]}', '#{params[:body_text]}', '#{params[:author]}', TIMESTAMP(2));"
	run_sql(sql)
# post redirect pattern - after finishing post, you start a new page, so user can't refresh and resubmit the same stuff
	redirect to '/'
end

def run_sql(sql)
# connect to the cats db
	conn = PG.connect(:dbname => 'crud_blog')
# exec the sql in the argument
	res = conn.exec(sql)
#close the db connection
	conn.close
# return the result of the sql
	res
# note: use of 'helper' allows it to also be available and shown in 'views'
	
end