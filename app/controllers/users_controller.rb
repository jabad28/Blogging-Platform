class UsersController < ApplicationController
  # has_secure_password

  def index
    @users = User.all
    render :index
  end

  def new
    @user = User.new

  end

  def create
    @user = User.create(user_params)
    redirect_to root_path
  end

  def show
    @user = User.find_by_id(params[:id])
    # @post = Post.find(params[:id])
    render :show
  end

  def create
    @user = User.create(user_params)
    login(@user)
    redirect_to @user
  end

  def edit
    @user = User.find(params[:id])
    unless current_user.id == @user.id
      flash[:notice] = "You may not edit other user accounts"
      redirect_to "/"
    end
  end

  def update
    @user = User.find(params[:id])
    unless user_params != nil
    end
    if current_user.id == @user.id
      @user.update_attributes(user_params)
      flash[:notice] = "Profile updated."
      redirect_to @user
    else
      flash[:notice] = @user.errors.full_messages
      redirect_to user_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :photo_url)
  end

end
