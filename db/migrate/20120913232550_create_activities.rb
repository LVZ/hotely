class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :name
      t.string :type
      t.integer :cost
      t.string :details
      t.datetime :start_at

      t.timestamps
    end
    add_index :activities, :name
    add_index :activities, :type
    add_index :activities, :cost
    add_index :activities, :start_at
  end
end
