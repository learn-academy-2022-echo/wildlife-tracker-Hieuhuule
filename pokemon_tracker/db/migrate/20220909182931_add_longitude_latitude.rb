class AddLongitudeLatitude < ActiveRecord::Migration[7.0]
  def change
    add_column :sightings, :latitude, :string
    add_column :sightings, :longitude, :string
  end
end
