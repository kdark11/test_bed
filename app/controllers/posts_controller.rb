class PostsController < ApplicationController
  http_basic_authenticate_with name: "admin", password: "djeter11", except: [:index, :show]
  
  def new
    @post = Post.new
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
    @post = Post.friendly.find(params[:id])
  end
  
  def index
    @posts = Post.friendly.all
  end
  
  def edit
    @post = Post.friendly.find(params[:id])
  end
  
  def update
    @post = Post.friendly.find(params[:id])
 
    if @post.update(params[:post].permit(:title, :body))
      redirect_to @post
    else
      render 'edit'
    end
  end
    
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
 
    redirect_to posts_path
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
