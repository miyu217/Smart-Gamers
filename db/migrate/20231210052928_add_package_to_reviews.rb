class AddPackageToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :package_name, :string
  end
end
