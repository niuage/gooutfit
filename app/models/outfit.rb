class Outfit < ActiveRecord::Base
  attr_accessible :name, :description

  belongs_to :user
  has_many :battle_outfits
  has_many :battles, through: :battle_outfits
end
