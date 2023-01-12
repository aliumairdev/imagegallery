# frozen_string_literal: true

ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation, :role_ids, :username

  batch_action :set_roles_to_clint, priority: 1 do |ids|
    batch_action_collection.find(ids).each do |user|
      user.add_role(:client)
    end
    redirect_to collection_path, alert: 'The user roles have been set to client.'
  end

  sidebar :help, only: :index do
    ul do
      li 'Second List First Item'
      li 'Second List Second Item'
    end
  end

  scope :admin, group: :roles
  scope :client, group: :roles
  scope :all, default: true

  index do
    selectable_column
    column :username
    column :email
    column :created_at
    column :roles
    column :attachments
    column 'custom_column' do |cc|
      cc.username + ' ' +
        cc.email
    end
    actions
  end

  filter :username
  filter :email
  filter :roles

  form do |f|
    f.inputs do
      f.input :username
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :roles, as: :check_boxes
    end
    f.actions
  end

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :username
  #
  # or
  #
  # permit_params do
  #   permitted = [:email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :username]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
