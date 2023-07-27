class CreateReports < ActiveRecord::Migration[6.1]
  def change
    create_table :reports do |t|
      t.integer :customer_id
      # t.integer :tag_id, null: false
      # t.text :address, null: false
      t.float :lat, null: false
      t.float :lng, null: false
      t.text :introduction, null: false


      t.timestamps
    end
  end
end
