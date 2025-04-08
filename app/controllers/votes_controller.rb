class VotesController < ApplicationController

  def create
    vote = Vote.new
    vote.user = current_user
    vote.post = Post.find(params[:post_id])
    vote.save!
    redirect_to posts_path
  end

  def destroy
    vote = Vote.find_by(user: current_user)
    vote.destroy()
    redirect_to posts_path
  end

end
