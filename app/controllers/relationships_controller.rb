class RelationshipsController < ApplicationController
  
  #フォローする時
  def create
    current_user.follow(params[:user_id])
    redirect_back(fallback_location: root_path)
  end
  #フォロー外す時
  def destroy
    current_user.unfollow(params[:user_id])
    redirect_back(fallback_location: root_path)
  end
  
  #フォロー一覧
  def followings
    user = User.find(params[:user_id])
    @users = user.followings
  end
  
  #フォロワー一覧
  def followers
    user = User.find(params[:user_id])
    @users = user.followers
  end
end
