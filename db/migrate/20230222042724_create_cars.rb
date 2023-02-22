class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.string :car_name
      t.string :image_url
      t.string :price
      t.string :car_description
      t.string :speed
      t.string :consumption
      
      t.timestamps
    end
  end
end
