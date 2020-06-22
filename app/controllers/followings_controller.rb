class FollowingsController < ApplicationController
  def create
    following = current_user.followings.new(followed_id: params[:id])
    flash[:danger] = 'Failed!' unless following.save
    redirect_to request.referrer
  end

  def destroy
    following = Following.find_by(followed_id: params[:id], follower_id: current_user.id)
    if following.follower == current_user
      following.destroy
    else
      flash[:danger] = 'Fail'
    end
    redirect_to request.referrer
  end
end
