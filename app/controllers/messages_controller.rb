class MessagesController < ApplicationController

  # before_action :authenticate_user!

  def index
    @groups = current_user.groups
    @current_group =  Group.find(params[:group_id])
    @message = @current_group.messages
    @group_member = @current_group.users
    @current_message = Message.new
    respond_to do |format|
      format.html
      format.json
    end
  end

  def new
    @message = Message.new
  end

  def create
    @message = current_user.messages.new(message_params)
    if @message.save
      respond_to do |format|
      format.html { redirect_to group_messages_path(params[:group_id]),notice: "メッセージ送信完了" }
      format.json
    end
    else
      redirect_to group_messages_path(params[:group_id]),notice: "送信失敗"
    end
  end

  private

  def message_params
    params.require(:message).permit(:detail, :image).merge(group_id: params[:group_id])
  end

end
