# frozen_string_literal: true

class CreateVisitors < ActiveRecord::Migration[5.0]
  def change
    create_table :visitors do |t|
      t.string :name
      t.string :gender

      t.timestamps
    end
  end
end
