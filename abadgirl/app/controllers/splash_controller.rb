class SplashController < ApplicationController
  def index
    @post = Post.all

    # render :index
  end
end
