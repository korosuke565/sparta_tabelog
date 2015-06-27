class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :store_name, null: false
      t.string :tel, null: false
      t.string :address, null: false
      t.string :website

      t.timestamps null: false
    end
  end
end
