class ChatsController < ApplicationController
  before_action :check_participating!, only: [:show]
  def index
    @chats = Chat.participating(current_user).order('updated_at DESC')
  end
  def show
    @chat = Chat.find(params[:id])
    @message = Message.new
  end

  private

  def check_participating!
    redirect_to index_path unless @chat && @chat.participates?(current_user)
  end
end
