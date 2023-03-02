class AddCoordinatesToVans < ActiveRecord::Migration[7.0]
  def change
    add_column :vans, :latitude, :float
    add_column :vans, :longitude, :float
    add_column :vans, :address, :string
  end
end
