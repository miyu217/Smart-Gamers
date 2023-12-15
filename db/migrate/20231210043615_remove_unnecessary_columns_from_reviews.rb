class RemoveUnnecessaryColumnsFromReviews < ActiveRecord::Migration[5.2]
  def change
    remove_column :reviews, :gameplay_rating, :float
    remove_column :reviews, :story_character_rating, :float
    remove_column :reviews, :in_app_purchase_rating, :float
    remove_column :reviews, :progression_rating, :float
    remove_column :reviews, :multiplayer_rating, :float
    remove_column :reviews, :community_rating, :float
    remove_column :reviews, :update_support_rating, :float
  end
end
