class Message < ActiveRecord::Base

  belongs_to :group
  belongs_to :user
  validates :detail_or_image, presence: true

  mount_uploader :image, ImageUploader

  private
  def detail_or_image
    detail.presence or image.presence
  end


end
