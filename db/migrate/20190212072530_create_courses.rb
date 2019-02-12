class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :name
      t.text :content
      t.integer :price
      t.string :instructor

      t.timestamps
    end
  end
end
