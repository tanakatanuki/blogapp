class FavoritesController < ApplicationController
  # お気に入りする
  def create
    favorite = current_user.favorites.create(bblog_id: params[:bblog_id])
    redirect_to bblogs_path
  end
  
  # お気に入り解除する
  def destroy
    favorite = current_user.favorites.find_by(bblog_id: params[:bblog_id]).destroy
    redirect_to bblogs_path
  end
end
