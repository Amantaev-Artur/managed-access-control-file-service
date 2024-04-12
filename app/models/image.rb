class Image < ApplicationRecord
  has_one_attached :picture

  validate :picture_presence

  private

  def picture_presence
    errors.add(:picture, "must be attached") unless picture.attached?
  end
end