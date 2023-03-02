class ChangeColumnsToStringVans < ActiveRecord::Migration[7.0]
  def change
    change_column :vans, :title, :string
    change_column :vans, :model, :string
  end
end
