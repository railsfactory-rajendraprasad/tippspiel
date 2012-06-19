class AddKoToSpiels < ActiveRecord::Migration
  def change
    add_column :spiels, :ko, :boolean, :default => false
  end
end

