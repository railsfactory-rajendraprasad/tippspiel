class AddWinnerIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :winner_id, :integer, :default => 0
  end
end

