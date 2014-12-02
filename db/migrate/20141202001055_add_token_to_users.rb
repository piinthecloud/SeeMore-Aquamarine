class AddTokenToUsers < ActiveRecord::Migration
  def change
    add_column :oauths, :token, :string
  end
end
