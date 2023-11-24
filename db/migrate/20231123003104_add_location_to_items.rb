class AddLocationToItems < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :state, :string
    add_column :items, :country, :string
  end
end
