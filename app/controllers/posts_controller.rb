class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity 
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
    redirect_to root_path
    else
      render :edit
  end
end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to "/"
   end


  def like_post
  @post = Post.find(params[:id])
  current_user_like = @post.likes.find_by(user_id: current_user.id)

  if current_user_like
    current_user_like.update(active: false)

  else
    @post.likes.create(user_id: current_user.id)
  end

  redirect_to root_path
  end

  def search
    if params[:search].blank?
      redirect_to post_path
    else
      @posts = Post.all.where("title LIKE ? OR description LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%")
    end
  end

  private                           
    def post_params
      params.require(:post).permit(:title, :description, :image, :category_id, :active)
    end
end
