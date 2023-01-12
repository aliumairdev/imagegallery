# frozen_string_literal: true

class AddStatusToReaction < ActiveRecord::Migration[5.0]
  def change
    add_column :reactions, :status, :integer, null: false
  end
end
