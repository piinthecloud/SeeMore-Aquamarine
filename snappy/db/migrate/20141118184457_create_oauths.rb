class CreateOauths < ActiveRecord::Migration
  def change
    create_table :oauths do |t|
      t.string :name
      t.integer :uid
      t.string :provider
      t.integer :user_id

      t.timestamps
    end
  end
end
