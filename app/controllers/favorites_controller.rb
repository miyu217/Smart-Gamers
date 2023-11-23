class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    @game = Game.find(params[:game_id])
    favorite = current_user.favorites.create(game: @game)
    redirect_to games_path, notice: "ゲームをお気に入りに追加しました"
  end

  def destroy
    favorite = current_user.favorites.find_by(game_id: params[:id])
    favorite.destroy if favorite
    redirect_to games_path, notice: "ゲームをお気に入りから削除しました"
  end
end
