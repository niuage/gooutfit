class CreateBattleOutfits < ActiveRecord::Migration
  def change
    create_table :battle_outfits do |t|
      t.references :battle
      t.references :outfit

      t.timestamps
    end
  end
end
