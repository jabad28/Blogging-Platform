class UsersController < ApplicationController
  # has_secure_password

  def index
    @users = User.all
    render :index
  end


  def new
    @user = User.new
    render :new
  end

  def create
    user_params = params.require(:user).permit(:first_name, :last_name, :email, :password)
    @user = User.create(user_params)

    redirect_to root_path
  end

  def show
    @user = User.find_by_id(params[:id])
    render :show
  end

  def create
    @user = User.create(user_params) # calls user_params method
    login(@user)
    redirect_to @user
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

end
