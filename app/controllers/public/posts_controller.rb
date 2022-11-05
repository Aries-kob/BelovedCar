class Public::PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.menber_id = current_menber.id
    if @post.save
      tags = Vision.get_image_data(@post.post_image)    
      tags.each do |tag|
        @post.tags.create(name: tag)
      end
      redirect_to public_posts_path
    else
      render :new
    end  
  end

  def index
    @posts = Post.order(created_at: :desc).page(params[:page])
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
