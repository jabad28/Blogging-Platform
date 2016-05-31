class PostsController < ApplicationController

  @beauty = Beauty.new
  @fashion = Fashion.new

  def index
    @post = Post.all
  end

  def index_beauty
    @posts = Post.all
  end

  def index_fashion
    @posts = Post.all
  end


  def show
    @post = Post.find_by_id(params[:id])
    render :show
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
    @post.save
    @beauty = Beauty.new
    @beauty.posts << @post
    if current_user.posts << @post
      flash[:notice] = "#{@post.title} created"
      redirect_to index_beauty_path(@post)
    else
      @post.destroy
      flash[:error] = "Something went wrong, please post again."
      redirect_to new_beauty_path
    end
  end

  def fashion_create
    @post = Post.new(post_params)
    @post.save
    @fashion = Fashion.new
    @fashion.posts << @post
    if current_user.posts << @post
      flash[:notice] = "#{@post.title} created"
      redirect_to index_fashion_path(@post)
    else
      @post.destroy
      flash[:error] = "Something went wrong, please post again."
      redirect_to new_fashion_path
    end
  end


  def edit
    @post = Post.find(params[:id])
  end


  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:success] = "Your post was successfully changed."
      redirect_to user_path(@post.user)
    else
      flash[:error] = "There was an error in your changes."
      redirect_to edit_post_path(@post)
    end
  end


  def destroy
    @post = Post.find(params[:post_id])
    @post.destroy
    redirect_to root_path
  end


  private

  def post_params
    params.require(:post).permit(:title, :body, :category, :beauty_post, :fashion_post, :item_1, :item_2, :item_3, :photo)
  end


end
