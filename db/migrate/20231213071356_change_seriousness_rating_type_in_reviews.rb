class ChangeSeriousnessRatingTypeInReviews < ActiveRecord::Migration[5.2]
  def change
    change_column :reviews, :seriousness_rating, :string
  end
end
