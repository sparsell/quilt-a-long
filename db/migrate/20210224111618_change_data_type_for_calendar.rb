class ChangeDataTypeForCalendar < ActiveRecord::Migration[6.0]
  def change

    change_column :qals, :start_date, :datetime
    change_column :qals, :end_date, :datetime

  end
end
