class CreateReportTags < ActiveRecord::Migration[6.1]
  def change
    create_table :report_tags do |t|
      t.integer :report_id, null: false
      t.integer :tag_id, null: false
      t.timestamps
    end
  end
end
