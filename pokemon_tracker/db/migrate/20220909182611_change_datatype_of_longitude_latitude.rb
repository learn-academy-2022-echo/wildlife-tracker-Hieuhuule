class ChangeDatatypeOfLongitudeLatitude < ActiveRecord::Migration[7.0]
  def change
    remove_column :sightings, :latitude, :integer
    remove_column :sightings, :longitude, :integer
  end
end
