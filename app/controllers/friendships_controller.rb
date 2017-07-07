class FriendshipsController < ApplicationController
  def create
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
    if @friendship.save
      flash[:notice] = "成功添加好友"
      redirect_to root_path
    else
      flash[:warning] = "无法添加好友"
      redirect_to root_path
    end
  end

  def destroy
    @friendship = current_user.friendships.find_by(friend_id: params[:id])
    @friendship.destroy
    flash[:success] = "删除好友成功"
    redirect_to chats_path
  end
end
