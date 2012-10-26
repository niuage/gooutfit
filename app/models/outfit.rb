class Outfit < ActiveRecord::Base
  attr_accessible :name, :description, :photo, :remote_photo_url

  belongs_to :user
  has_many :battle_outfits
  has_many :battles, through: :battle_outfits

  validates :user, presence: true
  validates :name, presence: true

  validate :photo_presence

  def photo_presence
    if photo.blank? && remote_photo_url.blank?
      errors.add(:photo, "can't touch that")
    end
  end

  scope :recent, order("created_at DESC")

  mount_uploader :photo, OutfitPhotoUploader

  paginates_per 12
end
