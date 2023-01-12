# frozen_string_literal: true

class AddUserToAttachments < ActiveRecord::Migration[5.0]
  def change
    add_reference :attachments, :user, foreign_key: true, index: true
  end
end
