# frozen_string_literal: true

class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.references :user, type: :uuid, null: false, foreign_key: true
      t.references :category, type: :uuid, null: false, foreign_key: true
      t.references :address, type: :uuid, foreign_key: true
      t.string :name, null: false
      t.text :description
      t.integer :status, default: 0, null: false
      t.decimal :starting_price, precision: 16, scale: 2, default: 0.00
      t.decimal :price_sold, precision: 16, scale: 2
      t.integer :rating
      t.datetime :bid_start_time
      t.datetime :bid_end_time
      t.text :delivery_options, array: true, default: ['Pickup', 'Home Delivery']
      t.string :selected_delivery

      t.timestamps
    end
  end
end
