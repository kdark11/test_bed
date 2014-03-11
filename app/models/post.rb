class Post < ActiveRecord::Base
  validates :title, presence: true
  
  def create
    @post = Post.new(params[:post])
    @post.save
    redirect_to @post
  end
end
