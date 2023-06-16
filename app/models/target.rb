# == Schema Information
#
# Table name: targets
#
#  id         :bigint           not null, primary key
#  topic_id   :bigint           not null
#  user_id    :bigint           not null
#  title      :string           not null
#  radius     :float            not null
#  latitude   :float            not null
#  longitude  :float            not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_targets_on_topic_id  (topic_id)
#  index_targets_on_user_id   (user_id)
#
class Target < ApplicationRecord
  belongs_to :topic
  belongs_to :user

  validates :title, :radius, :latitude, :longitude, presence: true
  validates :radius, numericality: { greater_than: 0 }
  validates :latitude, :longitude, numericality: true
end
