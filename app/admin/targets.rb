ActiveAdmin.register Target do
  actions :index

  controller do
    def scoped_collection
      super.includes(:user, :topic)
    end
  end

  permit_params :topic, :user, :title, :radius, :latitude, :longitude

  index do
    id_column
    column :topic
    column :user
    column :title
    column :radius
    column :latitude
    column :longitude
    column :created_at
    column :updated_at
  end
end
