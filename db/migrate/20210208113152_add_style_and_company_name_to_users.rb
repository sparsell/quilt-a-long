class AddStyleAndCompanyNameToUsers < ActiveRecord::Migration[6.0]
  def change

    add_column :users, :company_name, :string
    add_column :users, :quilting_style, :string

  end
end
