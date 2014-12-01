class AddUidToFeeds < ActiveRecord::Migration
  def change
    add_column :feeds, :uid, :integer
  end
end
