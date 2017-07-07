class MessagesController < ApplicationController
  before_action :find_chat!

  def new
    redirect_to chat_path(@chat) and return if @chat
    @message = current_user.messages.build
  end

   def create
     @chat ||= Chat.create(sender_id: current_user.id,reader_id: @reader.id)
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
     if params[:reader_id]
       @reader = User.find_by(id: params[:reader_id])
       redirect_to(root_path) and return unless @reader
       @chat = Chat.between(current_user.id,@reader.id)[0]

     else
       @chat = Chat.find_by(id: params[:chat_id])
       redirect_to(root_path) and return unless @chat &&
       @chat.participates?(current_user)
     end
   end
 end
