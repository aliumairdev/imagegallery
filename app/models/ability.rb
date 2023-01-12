# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    user ||= User.new # guest user (not logged in)

    if user.admin?
      can :manage, :all

    elsif user.client?
      can :read, ActiveAdmin::Page, name: 'Dashboard'
      can :create, Attachment
      can :update, Attachment do |attachment|
        attachment.user_id == user.id
      end
      can :destroy, Attachment do |attachment|
        attachment.user_id == user.id
      end
      alias_action :all_attachments, :show, :index, :show_gallery, to: :read
      can :read, Attachment

      alias_action :like, :dislike, to: :react
      can :react, Attachment

      alias_action :create_gallery, :new_gallery, to: :gallery_actions
      can :gallery_actions, User

      can :show, User, id: user.id

    else
      alias_action :all_attachments, :show, :show_gallery, to: :read
      can :read, Attachment
    end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
