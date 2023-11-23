class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses, id: :uuid do |t|
      t.references :user, type: :uuid, null: false, foreign_key: true
      t.string :number
      t.string :street
      t.string :city
      t.string :state
      t.string :country

      t.timestamps
    end
  end
end
