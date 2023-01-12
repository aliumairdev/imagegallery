# frozen_string_literal: true

class ChangeColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :attachments, :type, :image_type
  end
end
