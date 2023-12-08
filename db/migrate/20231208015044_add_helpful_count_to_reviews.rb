class AddHelpfulCountToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :helpful_count, :integer
  end
end
