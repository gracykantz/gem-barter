class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :review
      t.integer :user_reviewed_id
      t.timestamps
    end
  end
end
