class AddFieldsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :bio, :text
    add_column :users, :avatar, :string
    add_column :users, :average_rating, :integer
    add_column :users, :location, :string
  end
end
