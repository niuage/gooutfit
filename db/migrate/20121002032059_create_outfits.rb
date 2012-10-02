class CreateOutfits < ActiveRecord::Migration
  def change
    create_table :outfits do |t|
      t.string :name
      t.text :description
      t.references :user

      t.timestamps
    end
  end
end
