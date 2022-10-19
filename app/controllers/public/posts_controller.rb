class Public::PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.menber_id = current_menber.id
    if @post.save
      redirect_to public_posts_path
    else
      render :new
    end  
  end

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to public_posts_path
  end
  
  private
  
  def post_params
    params.require(:post).permit(:menber_id, :title, :introduction, :post_image)  
  end  
end
