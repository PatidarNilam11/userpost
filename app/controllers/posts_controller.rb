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


  private
  def post_params
    params.require(:post).permit(:title, :description, :category_id, :active)
  end
end
