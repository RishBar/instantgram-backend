class PostsController < ApplicationController
  include ActiveStorage::SetCurrent
  before_action :authenticate_user!

  def index
    @posts = Post.all
    render json: @posts
  end


  def create
    user = current_user
    @post = user.posts.build(post_params)
    @post.save
  end

  def post_params
      params.permit(:caption, :images => [])
  end

end
