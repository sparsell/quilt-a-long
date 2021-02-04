class AddAssociationIdsToQuilts < ActiveRecord::Migration[6.0]
  def change
    add_column :quilts, :quilter_id, :integer
    add_column :quilts, :qal_id, :integer
  end
end
