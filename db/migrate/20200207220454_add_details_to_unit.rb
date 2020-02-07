class AddDetailsToUnit < ActiveRecord::Migration[5.2]
  def change
    add_column :units, :address, :string
    add_column :units, :city, :string
    add_column :units, :state, :string
    add_column :units, :zip_code, :string
  end
end
