class Prizes < ActiveRecord::Migration[6.0]
  def change

    create_table :prizes do |t|
      t.string :prize_name
      t.integer :qal_id
      t.integer :sponsor_id
      end
    end
end

