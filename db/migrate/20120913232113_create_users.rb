class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.binary :crypted_password
      t.string :uid
      t.string :provider
      t.date :start_at
      t.date :end_at

      t.timestamps
    end
    add_index :users, :name
    add_index :users, :email
    add_index :users, :uid
    add_index :users, :provider
    add_index :users, :start_at
    add_index :users, :end_at
  end
end
