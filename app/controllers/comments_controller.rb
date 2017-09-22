class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_post
  before_action :find_comment, only: [:edit, :update, :destroy]
  load_and_authorize_resource param_method: :my_sanitizer
  load_and_authorize_resource :through => :current_user


  def create
    @comment = @post.comments.create(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      redirect_to post_path(@post)
    end
  end

  def edit
  end

  def update
    authorize! :update, @comment
    if @comment.update(comment_params)
      redirect_to post_path(@post)
    else
      render 'edit'
    end
  end

  def destroy
    authorize! :destroy, @comment
    @comment.destroy
    redirect_to post_path(@post)
  end


  private

    def my_sanitizer
      params.require(:comment).permit(:body)
    end

    def comment_params
      params.require(:comment).permit(:body)
    end

    def find_post
      @post = Post.find(params[:post_id])
    end

    def find_comment
      @comment = @post.comments.find(params[:id])
    end

end
