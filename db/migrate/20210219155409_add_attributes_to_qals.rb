class AddAttributesToQals < ActiveRecord::Migration[6.0]
  def change
    
    add_column :qals, :quilting_style, :string
    add_column :qals, :skill_level, :string

  end
end
