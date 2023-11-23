# frozen_string_literal: true

class CreateWallets < ActiveRecord::Migration[7.0]
  def change
    create_table :wallets, id: :uuid do |t|
      t.references :user, type: :uuid, null: false, foreign_key: true
      t.string :gateway, null: false, default: 'Paystack'
      t.string :customer_id
      t.decimal :balance, precision: 16, scale: 2, default: 0.00
      t.decimal :last_deposit, precision: 16, scale: 2, default: 0.00

      t.timestamps
    end
  end
end
