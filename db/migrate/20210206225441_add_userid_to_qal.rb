class AddUseridToQal < ActiveRecord::Migration[6.0]
  def change
    add_column :qals, :user_id, :integer
  end
end
