class SplashController < ApplicationController
  def index
    @user = User.new
  end

  def about
    render :about
  end
end
