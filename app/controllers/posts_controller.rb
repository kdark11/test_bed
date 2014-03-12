class PostsController < ApplicationController
  def new
  end
  
  def create
    @post = Post.new(post_params)
    #flash [:notice] = "Boom goes the Dynamite1"
    
    if @post.save
      flash[:notice] = "Boom goes the Dynamite1"
      redirect_to @post
    else
      render 'new'
  end
end
  
  def show
    @post = Post.find(params[:id])
  end
  
  def index
    @posts = Post.all
  end

private
    # Using a private method to encapsulate the permissible parameters
    # is just a good pattern since you'll be able to reuse the same
    # permit list between create and update. Also, you can specialize
    # this method with per-user checking of permissible attributes.
  def post_params
   params.require(:post).permit(:title, :body)
  end
end
