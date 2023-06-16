class ChangeLongitudeToFloat < ActiveRecord::Migration[7.0]
  def change
    change_column :targets, :longitude, :float
  end
end
