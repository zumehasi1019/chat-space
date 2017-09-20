class MessagesController < ApplicationController

  before_action :authenticate_user!

  def index
    @group = Group.find(params[:group_id])
    @message = Message.new
  end

  def create
    @message = Message.new (message_params)
      if @message.save
        redirect_to root_path
      else
        render new_group_path, notice: "メッセージを入力してね"
      end
  end

  def new
    @message = Message.new
  end

  private

  def message_params
    params.require(:message).permit(:detail, :image).merge(user_id: current_user.id, group_id: params[:group_id])
  end

end
