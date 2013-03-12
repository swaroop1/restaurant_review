class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.boolean :food_quality
      t.boolean :service
      t.boolean :ambience

      t.timestamps
    end
  end
end
