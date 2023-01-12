# frozen_string_literal: true

class AddImageToAttachments < ActiveRecord::Migration[5.0]
  def change
    add_column :attachments, :image, :string
  end
end
