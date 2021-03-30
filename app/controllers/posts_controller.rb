class PostsController < ApplicationController
  before_action :find_params, only: [:show, :edit, :update, :destroy]
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)

    if @post.save
      redirect_to root_path, notice: "#{@post.title} posted successfully."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to root_path, notice: "{@post.title} updated successfully."
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path, notice: "#{@post.title} deleted successfully."
  end

  private

    def post_params
      params.require(:post).permit(:title, :image)
    end

    def find_params
      @post = Post.find(params[:id])
    end
end
