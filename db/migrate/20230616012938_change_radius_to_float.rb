class ChangeRadiusToFloat < ActiveRecord::Migration[7.0]
  def change
    change_column :targets, :radius, :float
  end
end
