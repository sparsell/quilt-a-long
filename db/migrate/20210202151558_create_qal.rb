class CreateQal < ActiveRecord::Migration[6.0]
  def change
    create_table :qals do |t|
      t.string :qal_name
      t.integer :start_date
      t.integer :end_date
    end
  end
end
