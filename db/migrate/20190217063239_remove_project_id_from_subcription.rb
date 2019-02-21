class RemoveProjectIdFromSubcription < ActiveRecord::Migration[5.2]
  def change
    remove_column :subcriptions, :project_id, :INTEGER
  end
end
