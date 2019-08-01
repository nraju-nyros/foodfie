class RenameLangitudeToLongitude < ActiveRecord::Migration[5.2]
  def change
  	rename_column :locations, :longitude, :longitude
  end
end
