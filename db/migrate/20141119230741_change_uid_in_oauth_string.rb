class ChangeUidInOauthString < ActiveRecord::Migration
  def change
    change_column :oauths, :uid, :string
  end
end
