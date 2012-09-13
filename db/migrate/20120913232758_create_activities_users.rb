class CreateActivitiesUsers < ActiveRecord::Migration
  def change
    create_table :activities_users, id: false do |t|
      t.belongs_to :user
      t.belongs_to :activity

    end
    add_index :activities_users, :user_id
    add_index :activities_users, :activity_id
  end
end
