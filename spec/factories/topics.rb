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
FactoryBot.define do
  factory :topic do
    name { Faker::Name.unique.name }
    after(:build) do |topic|
      topic.icon.attach(io: File.open('spec/support/images/topic_feature.jpg'),
                        filename: 'topic_feature.jpg')
    end
  end
end

# require 'action_dispatch/testing/test_process'

# FactoryBot.define do
#   factory :topic do
#     name { Faker::Lorem.word }

#     # Crea un archivo de imagen temporal para adjuntar
#     transient do
#       icon_image { ActionDispatch::Http::UploadedFile.new(Rails.root.join('spec', 'support', 'images', 'topic_icon.jpg'), 'image/jpeg') }
#     end

#     # Asocia el archivo de imagen a la fábrica
#     after(:build) do |topic, evaluator|
#       topic.icon.attach(io: evaluator.icon_image.open, filename: evaluator.icon_image.original_filename)
#     end
#   end
# end