class Message < ActiveRecord::Base

  belongs_to :group
  belongs_to :user
  validates :detail_or_image, presence: true
  mount_uploader :image, ImageUploader

  def side_bar_message
    if messages.last.present?
      messages.last.try(:detail)
    elsif messages.image.last.try(:url)
      "画像が投稿されています"
    else
      "メッセージがありません"
    end
end

  private
  def detail_or_image
    detail.presence or image.presence
  end
end
