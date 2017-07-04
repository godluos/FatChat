class UsersController < ApplicationController
  before_action :authenticate_user! , only: [:join, :quit]

  def index
    @users = User.all
  end

  def join
    @friend = current_user.friend
    @user = User.find(params[:id])
    if !@friend.is_friend?(@user)
      @friend.join!(@user)
      flash[:notice] = "成功加入联系人"
    else
      flash[:warning] = "这位已经是联系人了"
    end
    redirect_to users_path
  end

  def quit
    @friend = current_user.friend
    @user = User.find(params[:id])
    if @friend.is_friend?(@user)
      @friend.quit!(@user)
      flash[:notice] = "成功删除联系人"
    else
      flash[:warning] = "这位和你苦大仇深啊，不是联系人还删？"
    end
    redirect_to users_path
  end

end
