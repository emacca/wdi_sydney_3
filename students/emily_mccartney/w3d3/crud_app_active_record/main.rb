require 'pry'
require 'sinatra'
require 'pry-debugger'
require 'sinatra/reloader' if development?
require 'active_support/all'
require 'pg'
require 'active_record'

ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :database => "blog_posts"
)

class Blog_Post < ActiveRecord::Base

   has_many :comments

   validates :title, :presence => true, :uniqueness => true, :length => { :maximum => 255, :to_long => "cant be that long"}, :length => { :in => 3..255 }
   validates :description, :presence => true
   validates :content, :presence => true
   validates :author, :presence => true, :length => { :maximum => 255 }

  before_update :refresh_updated_date
  before_create :set_created_at  
  
  def refresh_updated_date
    self.updated_at = Time.now
  end

  def set_created_at
    self.created_at = Time.now
  end

end

class Comment < ActiveRecord::Base

  belongs_to :blog_post

  validates :author, :presence => true
  validates :comment, :presence => true, :length => {:maximum => 600}
  
end

get '/' do
  @background = 'fullhome'
  erb :index

end

#new post
get '/posts/new' do
  @new_post = Blog_Post.new
  erb :new
end

#order posts by
get '/posts' do

  if params[:sort].present?
  @posts = Blog_Post.order(params[:sort]).all
  else
  @posts = Blog_Post.order("created_at DESC").all
  end  
  erb :home

end

#create post
post '/posts' do
   @new_post = Blog_Post.create(params[:post])
    if @new_post.valid?
    redirect to '/'
    else
    erb :new
  end
end


post '/posts/:id/comments' do
    @new_comment = Comment.new(:author => params[:author],:comment => params[:comment], :created_at => Time.now, :blog_post_id => params[:id])
    
    if @new_comment.save
      redirect to "/posts/#{params[:id]}"
    else
      @post = Blog_Post.find(params[:id])
      @comments = @post.comments
      erb :posts
  end
end

#get blog post id and comment
get '/posts/:id' do
  @post = Blog_Post.find(params[:id])
  @comments = @post.comments
  @new_comment = Comment.new
  erb :posts
end

#update the post
put '/posts/:id' do
  @post = Blog_Post.find("#{params[:id]}")
  if @post.update_attributes(params[:post])
    redirect to '/posts'
  else
    erb :update_posts
  end
end

#edit the posts
get "/posts/:id/edit" do

  @post = Blog_Post.find(params[:id])
  erb :update_posts 
end

#delete post
delete '/posts/:id' do
  #deletes the comments aswell as the blog post.
    Comment.where(:blog_post_id => "#{params[:id]}").delete_all

    post_delete = Blog_Post.find("#{params[:id]}")
    post_delete.delete
  redirect '/'
end


#delete Comments only
delete '/posts/:post_id/comments/:comment_id' do
  delete_comment = Comment.find("#{params[:comment_id]}")
  delete_comment.delete
  redirect to "/posts/#{params[:post_id]}"
end


