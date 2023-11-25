class RemoveUpdateAtFromRequest < ActiveRecord::Migration[5.2]
  def change
    remove_column :requests, :update_at, :datetime
  end
end
