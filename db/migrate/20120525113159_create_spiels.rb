class CreateSpiels < ActiveRecord::Migration
  def change
    create_table :spiels do |t|
      t.timestamp :start_at
      t.timestamp :finsihed_at
      t.integer :team_a_id
      t.integer :team_b_id
      t.string :result
      t.timestamps
    end
  end
end
