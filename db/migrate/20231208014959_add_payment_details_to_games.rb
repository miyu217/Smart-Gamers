class AddPaymentDetailsToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :payment_details, :text
  end
end
