class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  def index
    @posts = Post.all
  end

  def show
    @comment = Comment.new
    @post = Post.find(params[:id])
  end
end
