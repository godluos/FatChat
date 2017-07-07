class ChatsController < ApplicationController
  before_action :set_chat, except: [:index]
  before_action :check_participating!, except: [:index]

  def index
    @chats = Chat.participating(current_user).order('updated_at DESC')
    @friends = current_user.friends
  end
  def show
    @message = Message.new
    @friends = current_user.friends
  end

  private
  def set_chat
    @chat = Chat.find_by(id: params[:id])
  end

  def check_participating!
    redirect_to root_path unless @chat && @chat.participates?(current_user)
  end
end
