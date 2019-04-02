class ChangeDataTypeForPlaces < ActiveRecord::Migration[5.2]
  def change
    change_column(:places, :latitude, :float)
    change_column(:places, :longitude, :float)
end
end
