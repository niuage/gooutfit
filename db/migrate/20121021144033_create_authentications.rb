class CreateAuthentications < ActiveRecord::Migration
  def change
    create_table :authentications do |t|
      t.references :user
      t.string :uid
      t.string :provider
      t.string :oauth_token, default: nil
      t.string :oauth_secret, default: nil
      t.timestamps
    end
  end
end
