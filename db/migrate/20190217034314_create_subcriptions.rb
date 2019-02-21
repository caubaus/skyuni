class CreateSubcriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :subcriptions do |t|
      t.references :course, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_foreign_key :subcriptions, :courses
    add_foreign_key :subcriptions, :users

    add_index :subcriptions, [:course_id, :user_id], :unique => true
  end
end
