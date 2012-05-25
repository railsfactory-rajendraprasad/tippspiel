class CreateTipps < ActiveRecord::Migration
  def change
    create_table :tipps do |t|
      t.integer :user_id
      t.integer :spiel_id
      t.integer :team_a_result
      t.integer :team_b_result
      t.timestamps
    end
  end
end
