class DeleteSubscriptionsColumnMistakes < ActiveRecord::Migration
  def change
    remove_column(:subscriptions, :user_id, :string)
    remove_column(:subscriptions, :feed_id, :string)
  end
end
