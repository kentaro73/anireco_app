class PostsController < ApplicationController
  before_action :find_params, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy, :update]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    redirect_to "/welcomes" unless user_signed_in?
    @posts = Post.all.page(params[:page]).per(9)
  end

  def show
    @user = @post.user
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)

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
      redirect_to root_path, notice: "#{@post.title} updated successfully."
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
      params.require(:post).permit(:title, :image, :episode)
    end

    def find_params
      @post = Post.find(params[:id])
    end

    def correct_user
      @post = Post.find_by(id: params[:id])
      redirect_to root_path, notice: "You're not authorized." unless @post.user_id == current_user.id || current_user.admin?
    end
end
