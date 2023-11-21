#  frozen_string_literal: true

class AddOtherColumnsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :firstname, :string, null: false
    add_column :users, :lastname, :string, null: false
    add_column :users, :username, :string
    add_column :users, :phone, :string
    add_column :users, :image_url, :string
    add_column :users, :rating, :integer
    add_column :users, :country, :string, null: false, default: 'Nigeria'
  end
end
