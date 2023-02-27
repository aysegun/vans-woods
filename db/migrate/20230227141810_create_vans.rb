class CreateVans < ActiveRecord::Migration[7.0]
  def change
    create_table :vans do |t|
      t.text :title
      t.integer :price
      t.text :description
      t.integer :capacity
      t.text :model
      t.integer :year
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
