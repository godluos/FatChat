class MessagesController < ApplicationController
  before_action :find_chat!

   def create
     @message = current_user.messages.build(message_params)
     @message.chat_id = @chat.id
     @message.save!

     flash[:success] = "Your message was sent!"
     redirect_to chat_path(@chat)
   end

   private

   def message_params
     params.require(:message).permit(:body)
   end

   def find_chat!
     @chat = Chat.find_by(id: params[:chat_id])
     redirect_to(root_path) and return unless @chat && @chat.participates?(current_user)
   end
 end
