class FriendsController < ApplicationController
  def new
    @friend = Friend.new
  end

  def create
    @friend = Friend.new(friend_params)
    @friend.user = current_user
    if @friend.save
      ridirect_to friend_path
    else
      render :new
    end
  end

  def show
    @friend = current.friend
  end

  private
    def friend_params
      params.require(:friend).permit(:name,)
    end
end
