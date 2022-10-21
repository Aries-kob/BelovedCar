class Public::FavoritesController < ApplicationController
  def create
     @post = Post.find(params[:post_id])
      favorite = current_menber.favorites.new(post_id: @post.id)
      favorite.save
      #redirect_back(fallback_location: public_posts_path)
  end

  def destroy
    @post = Post.find(params[:post_id])
    favorite = current_menber.favorites.find_by(post_id: @post.id)
    favorite.destroy
    #redirect_back(fallback_location: public_posts_path)
  end
end
