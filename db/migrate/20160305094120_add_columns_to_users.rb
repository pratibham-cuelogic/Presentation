class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :full_name, :string
    add_reference :users, :role, index: true
    add_column :users, :status, :integer, default: 0
    add_column :users, :invited_by, :integer, default: nil
    add_column :users, :phone_no, :string
    add_column :users, :last_seen_at, :datetime
  end
end
