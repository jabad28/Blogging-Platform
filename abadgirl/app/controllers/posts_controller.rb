class PostsController < ApplicationController

  # GET /posts
  def index
    @post = Post.all
  end

  # GET /posts/1
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:post_id])
  end

  # POST /posts
  def create
    @post = Post.new(post_params)
    @post.save
    if current_user.posts.push(@post)
      flash[:notice] = "#{@post.title} created"
      redirect_to user_post_path(current_user.first_name,@post)
    else
      @post.destroy
      flash[:error] = "Something went wrong, please post again."
      redirect_to new_post_path
    end
  end

  # PUT /posts/1
  def update
    @post = Post.find(params[:post_id])
    if @post.update(post_params)
      flash[:success] = "Your post was successfully changed."
      redirect_to user_path(@post.user)
    else
      flash[:error] = "There was an error in your changes."
      redirect_to edit_post_path(@post)
    end
  end

  # DELETE /posts/1
  def destroy
    @post = Post.find(params[:post_id])
    @post.destroy
    redirect_to root_path
  end


  private

  def post_params
    params.require(:post).permit(:title, :body, :category, :beauty_post, :fashion_post, :item_1, :item_2, :item_3)
  end


end
