class ChangeColumnDefaultToReports < ActiveRecord::Migration[6.1]
  def change
    change_column_default :reports, :is_finished, from: nil, to: "false"
  end
end
