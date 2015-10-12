class UsersController < ApplicationController
  before_action :set_user, only: [:followers,:followings,:show,:edit,:update,:destroy]
  
  def show # 追加
   @microposts = @user.microposts
   
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user # ここを修正
    else
      render 'new'
    end
  end
  
  def edit
    
  end

  def update
    if @user.update(user_params)
      redirect_to user_path , notice:'プロフィールを編集しました'
    else
      render 'edit'
    end
  end
  
  def followings
    @following = @user.following_users
  end
  
  def followers
    @follower = @user.follower_users
  end
  
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :password,:city,
                                 :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end


end
