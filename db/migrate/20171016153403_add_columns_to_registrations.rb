class AddColumnsToRegistrations < ActiveRecord::Migration[5.1]
  def change
    add_column :registrations, :starts_at, :datetime
    add_column :registrations, :ends_at, :datetime
    add_column :registrations, :total, :decimal
  end
end
