class FriendsController < ApplicationController
  before_action :authenticate_user!

  def new
    if current_user.friend != nil
      redirect_to root_path, alert: "你已创建胖友圈"
    else
      @friend = Friend.new
    end
  end

  def create
    @friend = Friend.new(friend_params)
    @friend.user = current_user
    if @friend.save
      redirect_to root_path
    else
      render :new
    end
  end

  def index
    @friend = current_user.friend
  end



  private
    def friend_params
      params.require(:friend).permit(:name,)
    end
end
