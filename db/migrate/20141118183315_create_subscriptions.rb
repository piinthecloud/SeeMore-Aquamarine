class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.string :user_id
      t.string :feed_id

      t.timestamps
    end
  end
end
