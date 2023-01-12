# frozen_string_literal: true

class CreateLikes < ActiveRecord::Migration[5.0]
  def change
    create_table :likes do |t|
      t.references :user
      t.references :attachment

      t.timestamps
    end
  end
end
