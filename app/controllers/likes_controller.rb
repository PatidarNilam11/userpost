class LikesController < ApplicationController
  before_action :find_post
  before_action :find_like, only: [:destroy]

def create
    if already_liked?
        @post.likes.find_by(user_id: current_user.id).update(active: false)
    else
        @post.likes.find_or_create_by(user_id: current_user.id).update(active: true)
    end
    redirect_to post_path(@post)
end

  private
  def find_post
    @post = Post.find(params[:post_id])
  end

  def already_liked?
    Like.where(user_id: current_user.id, post_id:
    params[:post_id], active: true).exists?
  end

  def find_like
    @like = @post.likes.find(params[:id])
 end

end
