# frozen_string_literal: true

class Reaction < ApplicationRecord
  belongs_to :user
  belongs_to :attachment

  enum status: %i[dislike like]

  validates :reaction, presence: true
  validates :user_id, uniqueness: { scope: :attachment_id }

  scope :likes, -> { where(status: 1) }
  scope :dislikes, -> { where(status: 0) }
end
