class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.string :handle
      t.string :social_media

      t.timestamps
    end
  end
end
