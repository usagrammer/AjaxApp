class PostsController < ApplicationController
  def index
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    render json: { post: @post }
  end

  private

  def post_params
    params.require(:post).permit(:content).merge(user_id: current_user.id)
  end

  def checked
    post = Post.find(params[:id])
    if post.checked
      post.update(checked: false)
    else
      post.update(checked: true)
    end

    item = Post.find(params[:id])
    render json: { post: item }
  end
end
