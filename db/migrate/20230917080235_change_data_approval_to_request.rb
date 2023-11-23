class ChangeDataApprovalToRequest < ActiveRecord::Migration[5.2]
  def change
    change_column :requests, :approval, :string, default: '承認待ち'
  end
end
