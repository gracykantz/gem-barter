class AddRefToReviews < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :reviews, :users, column: :user_reviewed_id, index: true
    add_column :reviews, :user_reviewing_id, :integer
    add_foreign_key :reviews, :users, column: :user_reviewing_id, index: true
  end
end
