class MessagesController < ApplicationController

  # before_action :authenticate_user!

  def index
    @groups = current_user.groups
    @current_group =  Group.find(params[:group_id])
    @message = @current_group.messages
    @current_message = Message.new
    @group_member = @current_group.users
  end

  def new
    @message = Message.new
  end

  def create
    @message = current_user.messages.new(message_params)
    if @message.save
      redirect_to group_messages_path(params[:group_id]),notice: "メッセージ送信完了"
    else
      redirect_to group_messages_path(params[:group_id]),notice: "送信失敗"
    end
  end

  private

  def message_params
    params.require(:message).permit(:detail, :image).merge(group_id: params[:group_id])
  end

end
