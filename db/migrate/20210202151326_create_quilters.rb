class CreateQuilters < ActiveRecord::Migration[6.0]
  def change
    create_table :quilters do |t|
      t.string :quilter_name
    end
  end
end
