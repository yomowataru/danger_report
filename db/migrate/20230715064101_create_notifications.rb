class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.integer :report_id
      t.integer :comment_id
      t.integer :visiter_id, null: false
      t.integer :visited_id, null: false
      t.boolean :check, default: false, null:false

      t.timestamps
    end
  end
end
