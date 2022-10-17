class Public::PostCommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @post_comment = PostComment.new(post_id: @post.id)
  end
  def create
    @post = Post.find(params[:post_id])
    @post_comment = current_menber.post_comments.new(post_comment_params)
    @post_comment.post_id = @post.id
    @post_comment.save
    redirect_to public_post_path(@post.id)
  end

  def destroy
    PostComment.find(params[:id]).destroy
    @post = Post.find(params[:id])
    redirect_to public_post_path(@post.id)
  end
  
  private
  
  def post_params
    params.require(:post).permit(:menber_id, :title, :introduction, :post_image)  
  end  
  
  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end  
  
end
