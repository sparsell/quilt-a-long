class AddQalIdToQuilters < ActiveRecord::Migration[6.0]
  def change
    add_column :quilters, :qal_id, :integer
  end
end
