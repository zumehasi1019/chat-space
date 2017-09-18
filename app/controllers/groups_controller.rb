class GroupsController < ApplicationController

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(create_params)
    if @group.save
      redirect_to root_path, notice: "グループを作成しました"
    else
      render new_group_path, notice: "失敗！"
    end
  end

  def index
  end

  private
  def create_params
    params.require(:group).permit(:name, user_ids:[])
  end
end
