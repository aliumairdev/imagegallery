# frozen_string_literal: true

class CreateAttachments < ActiveRecord::Migration[5.0]
  def change
    create_table :attachments do |t|
      t.string :title
      t.string :type
      t.string :description
      t.integer :price
      t.string :created_by
      t.string :place

      t.timestamps
    end
  end
end
