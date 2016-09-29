class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :followings, :followers, :like_sample]
  
  def like_sample
    @samples = @user.like_samples
    @title = "いいね!一覧"
    @cnt = @user.likes.count
    render 'show'
  end
  
  def show
    @samples = @user.samples
    @title = "投稿一覧"
    @cnt = @user.samples.count
  end
  
  def followings
    @users = @user.following_users
    render 'relationships'
  end
  
  def followers
    @users = @user.follower_users
    render 'relationships'
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    file = params[:user][:image]
    @user.set_image(file)
    if @user.save
      flash[:success] = "welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    file = params[:user][:image]
    @user.set_image(file)
    @user.update(user_params)
    redirect_to current_user
  end
  
  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
    
    def set_user
      @user = User.find(params[:id])
    end
end
