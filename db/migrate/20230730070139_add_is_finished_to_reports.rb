class AddIsFinishedToReports < ActiveRecord::Migration[6.1]
  def change
    add_column :reports, :is_finished, :boolean
  end
end
