class Group < ActiveRecord::Base
  has_many :users, through: :group_users
  has_many :group_users
  has_many :messages
  validates :name, presence: true

  def side_bar_message
    if messages.last.try(:image).present?
      "画像が投稿されています"
    elsif messages.last.try(:detail)
      messages.last.try(:detail)
    else
      "メッセージがありません"
    end
  end

end
