class ConversationsController < ApplicationController
  before_action :authenticate_user!
  # before_action :guest_user?
  # before_action :message_able?,only:[:create]
  def index
    @conversations = Conversation.all
  end
  def create
    if user_signed_in?
      if Conversation.between(params[:sender_id], params[:recipient_id]).present?
        @conversation = Conversation.between(params[:sender_id], params[:recipient_id]).first
      else
        @conversation = Conversation.create!(conversation_params)
      end
      redirect_to conversation_messages_path(@conversation)
    else
      redirect_to tops_path
    end
  end
  private
  def conversation_params
    params.permit(:sender_id,:recipient_id)
  end
end
