class RemoveImageFromTopics < ActiveRecord::Migration[7.0]
  def change
    remove_column(:topics, :image, :string)
  end
end
