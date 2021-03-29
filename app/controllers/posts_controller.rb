class PostsController < ApplicationController
  before_action :find_params, only: [:show, :edit]
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def edit
  end

  private

    def post_params
      params.require(:post).permit(:title)
    end

    def find_params
      @post = Post.find(params[:id])
    end
end
