class ChangeTagInLecture < ActiveRecord::Migration[5.2]
  def change
    change_column :lectures, :tag, :integer #change colum lecture - field tag - to interger
  end
end
