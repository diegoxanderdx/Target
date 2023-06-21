class CreateTargets < ActiveRecord::Migration[7.0]
  def change
    create_table :targets do |t|
      t.references :topic, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :title, null: false
      t.float :radius, null: false
      t.float :latitude, null: false
      t.float :longitude, null: false

      t.timestamps
    end
  end
end
