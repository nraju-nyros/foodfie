class AddlatitudeToLocation < ActiveRecord::Migration[5.2]
  def change
    add_column :locations, :latitude, :float
    add_column :locations, :langitude, :float
  end
end
