# frozen_string_literal: true

class AddLikeToLikes < ActiveRecord::Migration[5.0]
  def change
    add_column :likes, :reaction, :boolean, null: false
  end
end
