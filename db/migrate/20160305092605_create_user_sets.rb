class CreateUserSets < ActiveRecord::Migration
  def change
    create_table :user_sets do |t|
      t.references :user, index: true
      t.references :technology, index: true
      t.integer :invitee_id
      t.datetime :start_time
      t.datetime :end_time
      t.integer :score
      t.integer :status, default: 0
      t.timestamps
    end
  end
end
