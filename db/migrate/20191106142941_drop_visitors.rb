# frozen_string_literal: true

class DropVisitors < ActiveRecord::Migration[5.0]
  def change
    drop_table :visitors
  end
end
