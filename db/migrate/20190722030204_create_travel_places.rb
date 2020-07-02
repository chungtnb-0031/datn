class CreateTravelPlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :travel_places do |t|
      t.string :name
      t.text :content
      t.string :address
      t.float :rate_point
      t.references :type_travel_place, foreign_key: true
      t.references :city, foreign_key: true

      t.timestamps
    end
  end
end
