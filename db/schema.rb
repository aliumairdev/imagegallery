# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_191_106_142_941) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'active_admin_comments', force: :cascade do |t|
    t.string   'namespace'
    t.text     'body'
    t.string   'resource_type'
    t.integer  'resource_id'
    t.string   'author_type'
    t.integer  'author_id'
    t.datetime 'created_at',    null: false
    t.datetime 'updated_at',    null: false
    t.index %w[author_type author_id], name: 'index_active_admin_comments_on_author_type_and_author_id', using: :btree
    t.index ['namespace'], name: 'index_active_admin_comments_on_namespace', using: :btree
    t.index %w[resource_type resource_id], name: 'index_active_admin_comments_on_resource_type_and_resource_id', using: :btree
  end

  create_table 'admin_users', force: :cascade do |t|
    t.string   'email',                  default: '', null: false
    t.string   'encrypted_password',     default: '', null: false
    t.string   'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at',                          null: false
    t.datetime 'updated_at',                          null: false
    t.index ['email'], name: 'index_admin_users_on_email', unique: true, using: :btree
    t.index ['reset_password_token'], name: 'index_admin_users_on_reset_password_token', unique: true, using: :btree
  end

  create_table 'attachments', force: :cascade do |t|
    t.string   'title'
    t.string   'image_type'
    t.string   'description'
    t.integer  'price'
    t.string   'created_by'
    t.string   'place'
    t.datetime 'created_at',              null: false
    t.datetime 'updated_at',              null: false
    t.string   'image'
    t.integer  'user_id'
    t.integer  'amount', default: 1, null: false
    t.index ['user_id'], name: 'index_attachments_on_user_id', using: :btree
  end

  create_table 'reactions', force: :cascade do |t|
    t.integer  'user_id'
    t.integer  'attachment_id'
    t.datetime 'created_at',    null: false
    t.datetime 'updated_at',    null: false
    t.integer  'status',        null: false
    t.boolean  'reaction'
    t.index ['attachment_id'], name: 'index_reactions_on_attachment_id', using: :btree
    t.index ['user_id'], name: 'index_reactions_on_user_id', using: :btree
  end

  create_table 'roles', force: :cascade do |t|
    t.string   'name'
    t.string   'resource_type'
    t.integer  'resource_id'
    t.datetime 'created_at',    null: false
    t.datetime 'updated_at',    null: false
    t.index %w[name resource_type resource_id], name: 'index_roles_on_name_and_resource_type_and_resource_id', using: :btree
    t.index ['name'], name: 'index_roles_on_name', using: :btree
    t.index %w[resource_type resource_id], name: 'index_roles_on_resource_type_and_resource_id', using: :btree
  end

  create_table 'users', force: :cascade do |t|
    t.string   'email',                  default: '', null: false
    t.string   'encrypted_password',     default: '', null: false
    t.string   'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at',                          null: false
    t.datetime 'updated_at',                          null: false
    t.string   'username'
    t.index ['email'], name: 'index_users_on_email', unique: true, using: :btree
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true, using: :btree
  end

  create_table 'users_roles', id: false, force: :cascade do |t|
    t.integer 'user_id'
    t.integer 'role_id'
    t.index ['role_id'], name: 'index_users_roles_on_role_id', using: :btree
    t.index %w[user_id role_id], name: 'index_users_roles_on_user_id_and_role_id', using: :btree
    t.index ['user_id'], name: 'index_users_roles_on_user_id', using: :btree
  end

  add_foreign_key 'attachments', 'users'
end
