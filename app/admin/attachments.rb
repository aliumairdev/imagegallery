# frozen_string_literal: true

ActiveAdmin.register Attachment do
  permit_params :title, :image_type, :description, :price, :created_by, :place, :image, :user_id

  config.per_page = 20

  index do
    column :id
    column :title
    column :created_at
    column :user
    actions
  end

  action_item :view, only: :show do
    if attachment.image?
      link_to 'view image of this attachment', attachment.image.url, target: ' '
    end
  end

  filter :title
  filter :image_type
  filter :price
  filter :place
  filter :amount

  form do |f|
    f.inputs do
      f.input :user
      f.input :title
      f.input :description
      f.input :image_type
      f.input :price
      f.input :place
      f.input :amount
      f.input :created_by
      f.inputs :image
    end
    f.actions
  end

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :title, :image_type, :description, :price, :created_by, :place, :image, :user_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :image_type, :description, :price, :created_by, :place, :image, :user_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
