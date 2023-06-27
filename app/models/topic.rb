# == Schema Information
#
# Table name: topics
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_topics_on_name  (name) UNIQUE
#
class Topic < ApplicationRecord
  has_many :targets, dependent: :restrict_with_exception
  has_one_attached :icon

  validates :name, presence: true, uniqueness: true

  def icon_url
    Rails.application.routes.url_helpers.rails_blob_url(icon, only_path: true)
  end
end
