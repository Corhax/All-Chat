class PostsController < ApplicationController
  before_action :find_post, only: [:show, :update, :edit, :destroy]
  def index
    @posts = Post.all.order("created_at DESC")
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to root_path, notice: "Post was succesfuly created"
    else
      render 'new', notice: "Something went wrong!"
    end
  end

  def show
  end

  def edit
    authorize! :update, @post
  end

  def update
    authorize! :update, @post
    @post.update(post_params)
    redirect_to root_path(@post)
  end

  def destroy
    authorize! :destroy, @post
    if @post.destroy
      redirect_to root_path, notice: "Post was removed succesfuly!"
    else
      render 'new', notice: "Something went wrong!"
    end
  end

  private
    def post_params
      params.require(:post).permit(:body)
    end

    def find_post
      @post = Post.find(params[:id])
    end

end
