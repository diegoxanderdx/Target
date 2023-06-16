class ChangeLatitudeToFloat < ActiveRecord::Migration[7.0]
  def change
    change_column :targets, :latitude, :float
  end
end
