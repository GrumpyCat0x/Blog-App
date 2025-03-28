class PostsController < ApplicationController
  before_action :require_login, except: [:index, :show]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user, only: [:edit, :update, :destroy]

  def index
    @posts = Post.includes(:user, :categories)
                 .published
                 .recent
                 .paginate(page: params[:page], per_page: 10)
  end

  def show
    @comment = Comment.new
    @comments = @post.comments.includes(:user).recent
  end

  def new
    @post = current_user.posts.build
    @categories = Category.all
  end

  def create
    @post = current_user.posts.build(post_params)
    update_categories

    if @post.save
      flash[:success] = "Post created successfully!"
      redirect_to @post
    else
      @categories = Category.all
      render 'new'
    end
  end

  def edit
    @categories = Category.all
  end

  def update
    update_categories

    if @post.update(post_params)
      flash[:success] = "Post updated"
      redirect_to @post
    else
      @categories = Category.all
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    flash[:success] = "Post deleted"
    redirect_to posts_path
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :published)
  end

  def authorize_user
    unless current_user?(@post.user) || current_user.admin?
      flash[:danger] = "You don't have permission to perform this action."
      redirect_to posts_path
    end
  end

  def update_categories
    @post.categories = []
    if params[:category_ids].present?
      params[:category_ids].each do |category_id|
        @post.categories << Category.find(category_id) unless category_id.empty?
      end
    end
  end
end