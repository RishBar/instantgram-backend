class PostsController < ApplicationController
  before_action :authenticate_user!

  def create
    user = current_user
    @post = user.posts.build(post_params)
    @post.save
  end

  def post_params
      params.permit(:caption, :images)
  end

end
