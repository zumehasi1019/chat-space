class GroupsController < ApplicationController

  before_action :set_edit, only: [:edit, :update]

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to root_path, notice: "グループを作成しました"
    else
      render new_group_path, notice: "失敗！"
    end
  end

  def index
  end

  def edit
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to root_path, notice: "グループの編集できた!"
    else
      render :edit,notice: "グループの編集できていないよ！!"
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, user_ids: [])
  end

  def set_edit
    @group = Group.find(params[:id])
  end

end
