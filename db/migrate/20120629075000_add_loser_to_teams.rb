class AddLoserToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :loser, :boolean, :default=> true
  end
end