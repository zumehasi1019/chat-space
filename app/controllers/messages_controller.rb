class MessagesController < ApplicationController

  before_action :authenticate_user!

  def index
    @groups = current_user.groups
    @current_group =  @groups.find(params[:group_id])
    @message = @current_group.messages
    @current_message = Message.new
    @group_member = @current_group.users
  end

  def create
    @message = current_user.messages.new(message_params)
      if @message.save
        redirect_to group_messages_path(params[:group_id]),notice: "メッセージ送信完了"
      else
        render new_group_path, alert: "メッセージを入力してね"
      end
  end

  def new
    @message = Message.new
  end

  private

  def message_params
    params.require(:message).permit(:detail, :image).merge(group_id: params[:group_id])
  end

end
