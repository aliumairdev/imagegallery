# frozen_string_literal: true

Rails.application.routes.draw do
  get 'visitors/index'

  root to: 'visitors#index'
  resources :visitors

  # devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users, controllers: { registrations: 'registrations' } do
    match 'users/sign_out', to: 'devise/sessions#destroy', via: :delete
  end
  resources :users do
    match '/new_gallery', to: 'users#new_gallery', via: :get
    match '', to: 'users#create_gallery', via: :patch
  end

  resources :attachments do
    member do
      post 'like'
      post 'dislike'
    end
  end
  get 'all_attachments', to: 'attachments#all_attachments'
  get '/:id/show_gallery', to: 'attachments#show_gallery', as: 'gallery'
  resources :roles
  resources :orders
  get '/orders/confirm_order', to: 'orders#confirm_order'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
