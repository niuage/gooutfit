class BattleOutfit < ActiveRecord::Base
  belongs_to :outfit
  belongs_to :battle
end
