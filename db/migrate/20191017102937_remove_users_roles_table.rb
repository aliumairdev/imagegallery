# frozen_string_literal: true

class RemoveUsersRolesTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :users_roles
  end
end
