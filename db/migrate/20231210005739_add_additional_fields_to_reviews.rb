class AddAdditionalFieldsToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :spent_amount, :decimal, precision: 10, scale: 2
    add_column :reviews, :seriousness_rating, :integer
    add_column :reviews, :gameplay_rating, :float
    add_column :reviews, :story_character_rating, :float
    add_column :reviews, :in_app_purchase_rating, :float
    add_column :reviews, :progression_rating, :float
    add_column :reviews, :multiplayer_rating, :float
    add_column :reviews, :community_rating, :float
    add_column :reviews, :update_support_rating, :float
  end
end
