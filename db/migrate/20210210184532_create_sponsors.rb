class CreateSponsors < ActiveRecord::Migration[6.0]
  def change
    create_table :sponsors do |t|
      t.string :sponsor_name
      t.timestamps
    end
  end
end
