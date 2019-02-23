class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.references :course, foreign_key: true
      t.references :user, foreign_key: true
      t.text :comment
      t.datetime :created_at
      t.integer :star

      t.timestamps
    end
    add_foreign_key :reviews, :courses
    add_foreign_key :reviews, :users
  end
end
