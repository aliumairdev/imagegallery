# frozen_string_literal: true

class User < ApplicationRecord
  attr_accessor :current_password
  after_create :assign_default_role
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :attachments, dependent: :destroy
  accepts_nested_attributes_for :attachments

  has_many :reactions

  def admin?
    has_role?(:admin)
  end

  def client?
    has_role?(:client)
  end

  def visitor?
    has_role?(:visitor)
  end

  def assign_default_role
    add_role(:client) if roles.blank?
  end

  scope :admin, -> { joins(:roles).where(roles: { name: 'admin' }) }
  scope :client, -> { joins(:roles).where(roles: { name: 'client' }) }
end
