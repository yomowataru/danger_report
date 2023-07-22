class CreateReports < ActiveRecord::Migration[6.1]
  def change
    create_table :reports do |t|
      # t.integer :customer_id, null: false
      # t.integer :tag_id, null: false
      # t.text :adress, null: false
      # t.float :latitude, null: false
      # t.float :longitude, null: false
      t.text :introduction, null: false
      

      t.timestamps
    end
  end
end
