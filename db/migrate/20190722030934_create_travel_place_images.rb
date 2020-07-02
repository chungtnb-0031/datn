class CreateTravelPlaceImages < ActiveRecord::Migration[5.2]
  def change
    create_table :travel_place_images do |t|
      t.string :link
      t.references :travel_place, foreign_key: true

      t.timestamps
    end
  end
end
