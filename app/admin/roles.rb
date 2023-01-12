# frozen_string_literal: true

ActiveAdmin.register Role do
  permit_params :name

  actions :all, except: [:destroy]

  config.per_page = 20

  index do
    column :id
    column :name
    column :resource_type
    column :users
    actions
  end

  filter :name
  filter :users

  form do |f|
    f.inputs do
      f.input :name
    end
    f.actions
  end

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :resource_type, :resource_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :resource_type, :resource_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
