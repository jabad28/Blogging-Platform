class PostsController < ApplicationController

  def index
    @posts = Post.all
    @users = User.all
  end

  def index_beauty
    @posts = Post.where(beauty_post: true)
  end

  def index_fashion
    @posts = Post.where(fashion_post: true)
  end


  def show
    @post = Post.find_by_id(params[:id])
    @user = current_user #User.find_by_id(params[:id])
  end


  def new_beauty
    @posts = Post.all
    @post = Post.new
    render :new_beauty
  end


  def new_fashion
    @post = Post.new
    render :new_fashion
  end


  def beauty_create
    @post = Post.new(post_params)
    @post.beauty_post = true
    @post.save
    if current_user.posts << @post
      flash[:notice] = "#{@post.title} created"
      redirect_to index_beauty_path()
    else
      @post.destroy
      flash[:error] = "Something went wrong, please post again."
      redirect_to new_beauty_path
    end
  end

  def fashion_create
    @post = Post.new(post_params)
    @post.fashion_post = true
    @post.save
    if current_user.posts << @post
      flash[:notice] = "#{@post.title} created"
      redirect_to index_fashion_path()
    else
      @post.destroy
      flash[:error] = "Something went wrong, please post again."
      redirect_to new_fashion_path
    end
  end


  def edit
    @post = Post.find(params[:id])
    @user = current_user
  end


  def update
    @post = Post.find(params[:id])
    @user = current_user
    if @post.update(post_params)
      flash[:success] = "Your post was successfully changed."
      redirect_to post_path(@post)
    else
      flash[:error] = "There was an error in your changes."
      redirect_to edit_post_path(@post)
    end
  end


  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path
  end


  private

  def post_params
    params.require(:post).permit(:title, :body, :beauty_post, :fashion_post, :photo_url)
  end


end
