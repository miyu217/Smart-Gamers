class RemoveCreateAtFromRequest < ActiveRecord::Migration[5.2]
  def change
    remove_column :requests, :create_at, :datetime
  end
end
