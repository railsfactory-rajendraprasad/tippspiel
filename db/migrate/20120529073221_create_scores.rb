class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.integer :spiel_id
      t.integer :user_id
      t.integer :score
      t.timestamps
    end
  end
end
