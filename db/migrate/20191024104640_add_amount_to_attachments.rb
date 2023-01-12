# frozen_string_literal: true

class AddAmountToAttachments < ActiveRecord::Migration[5.0]
  def change
    add_column :attachments, :amount, :integer, null: false, default: '1'
  end
end
