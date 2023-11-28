class AddGameDetailsToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :developer, :string
    add_column :games, :release_date, :date
    add_column :games, :price, :integer
  end
end
