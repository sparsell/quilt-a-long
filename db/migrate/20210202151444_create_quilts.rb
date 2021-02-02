class CreateQuilts < ActiveRecord::Migration[6.0]
  def change
    create_table :quilts do |t|
      t.string :quilt_name 
      t.boolean :is_finished
    end
  end
end
