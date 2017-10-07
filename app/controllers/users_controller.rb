class UsersController < ApplicationController

def index
  @users = User.all

end

def show
  @user = User.friendly.find(params[:id])
  @posts = Post.all.limit(3).order("created_at DESC")
end


end
