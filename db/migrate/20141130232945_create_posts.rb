class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :content
      t.integer :feed_id
      t.datetime :datetime

      t.timestamps
    end
  end
end
