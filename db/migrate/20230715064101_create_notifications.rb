class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.integer :comment_id, null: false
      t.integer :visiter_id, null: false
      t.integer :visited_id, null: false
      t.integer :micropost_id, null: false
      t.boolean :check, null:false, default: false

      t.timestamps
    end
  end
end
