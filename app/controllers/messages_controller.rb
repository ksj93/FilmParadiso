class MessagesController < ApplicationController
  before_action :authenticate_user!
  # before_action :guest_user?
  before_action do
    @conversation = Conversation.find(params[:conversation_id])
  end

  def index
    @conversations = Conversation.where(sender_id:current_user).or(Conversation.where(recipient_id:current_user))
    @messages = @conversation.messages
    if @messages.length > 10
      @over_ten = true
      @messages = Message.where(id: @messages[-10..-1].pluck(:id))
    end
    if params[:m]
      @over_ten = false
      @messages = @conversation.messages
    end
    if @messages.last
      @messages.where.not(user_id: current_user.id).update_all(read: true)
    end
    @messages = @messages.order(:created_at)
    @message = @conversation.messages.build
  end

  def create
    @conversations = Conversation.where(sender_id:current_user).or(Conversation.where(recipient_id:current_user))
    @message = @conversation.messages.build(message_params)
    if @message.save
      redirect_to conversation_messages_path(@conversation)
    else
      redirect_to conversation_messages_path(@conversation),notice: '空白では送れません！もう一回内容を整えて送ってください'
    end
  end

  private
  def message_params
    params.require(:message).permit(:body, :user_id)
  end
end
