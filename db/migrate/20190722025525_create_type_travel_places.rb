class CreateTypeTravelPlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :type_travel_places do |t|
      t.string :name

      t.timestamps
    end
  end
end
