require 'pry'
require 'sinatra'
require 'pry-debugger'
require 'sinatra/reloader' if development?
require 'active_support/all'
require 'pg'

before do
end

get '/' do
  erb :index
end

#new post
get '/posts/new' do
  erb :new
end

#order posts by
get '/posts' do
  if params[:sort].present?
  sql = "SELECT * FROM blog_posts ORDER BY #{params[:sort]}"
  else
    sql = "SELECT * FROM blog_posts ORDER BY created_at DESC"
  end
  @rows = run_sql(sql)
  erb :home

end

#this is a route to create a blog post, the form will have this route in the method
post '/posts' do
  sql = "INSERT INTO blog_posts(title, description, content, author, created_at) VALUES('#{params[:title]}', '#{params[:description]}', '#{params[:content]}', '#{params[:author]}', '#{Time.now}');"

  run_sql(sql)
  redirect to '/'
end

#need a route to create comments which has the insertvalues, the id needs to be the blogpost id, but it doesnt need to be in quotes as it is a number, the form will have the route.
post '/posts/:id' do
   sql ="INSERT INTO comments (comment, author, created_at, blog_posts_id) VALUES('#{params[:comment]}', '#{params[:author]}', '#{Time.now}', #{params[:id]});"
   run_sql(sql)
   redirect to "/posts/#{params[:id]}"
end

#this calls the select statements from the database tables and runs them for specific items, 
get '/posts/:id' do
  sql = "SELECT * FROM blog_posts WHERE id=#{params[:id]}"
  @records = run_sql(sql)
  @post = @records[0]
  

  sql = "SELECT * FROM comments WHERE blog_posts_id = #{params[:id]}"
  @comments = run_sql(sql)

  erb :posts
end

#update the post
put '/posts/:id' do
  sql = "UPDATE blog_posts SET title='#{params[:title]}',description='#{params[:description]}',content='#{params[:content]}',author='#{params[:author]}',updated_at='#{Time.now}' WHERE id=#{params[:id]}"

  run_sql(sql)
  redirect to '/'
end


get "/posts/:id/edit" do
  sql = "SELECT * FROM blog_posts WHERE id=#{params[:id]} ORDER BY created_at"
  @records = run_sql(sql)
  @post = @records[0]
  erb :update_posts 
end

#delete post
delete '/posts/:id' do
  #deletes the comments aswell as the blog post.
  sql = "DELETE FROM comments WHERE blog_posts_id=#{params[:id]}"
  run_sql(sql)
  #deletes the blog post when it has no comments
  sql = "DELETE FROM blog_posts WHERE id=#{params[:id]}"
  run_sql(sql)
  redirect '/'
end


#delete Comments only
delete '/posts/:post_id/comments/:comment_id' do

  sql = "DELETE FROM comments WHERE id = #{params[:comment_id]}"
  run_sql(sql)
  redirect to "/posts/#{params[:post_id]}"
end


#running the database 
def run_sql(sql)
  #connect to the cats database
  conn = PG.connect(:dbname => 'blog_posts')
  #execute the sql in the arguement
  res = conn.exec(sql)
  #close the database connection
  conn.close
  #return the result of the sql
  res
end


