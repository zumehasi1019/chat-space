require 'rails_helper'

describe Message do
  describe '#create' do

    it "is valid with a detail in the message " do
      message = build(:message, image: nil)
      expect(message).to be_valid
    end

    it "is valid with a image in the message " do
      message = build(:message)
      expect(message).to be_valid
    end

    it "is valid with detail and image in the message" do
      message = build(:message)
      expect(message).to be_valid
    end

    it "is invalid without detail and image in the message" do
      message = build(:message, detail: nil, image: nil)
      message.valid?
      expect(message).not_to be_valid
    end

    it "is invalid without a group_id" do
      message = build(:message, group_id: nil)
      message.valid?
      expect(message.errors[:group_id]).to include("を入力してください")
    end

    it "is invalid without a user_id" do
      message = build(:message, user_id: nil)
      message.valid?
      expect(message.errors[:user_id]).to include("を入力してください")
    end
  end
end
