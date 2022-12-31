class FavoritesController < ApplicationController
  def create
    @user = User.find(params[:id])
    favorite = current_user.favorites.new(user_id)
    favorite.save
    redirect_to user_path(@user)
  end

  def destroy
    @user = User.find(params[:id])
    favorite = current_user.favorites.find_by(user_id)
    favorite.destroy
    redirect_to user_path
  end
end
