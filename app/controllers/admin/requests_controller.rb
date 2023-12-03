class Admin::RequestsController < ApplicationController
  before_action :authenticate_admin
  before_action :set_request, only: [:approve, :reject, :edit, :update]

  def index
    @requests = Request.all
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      flash[:notice]="ゲームが追加されました！"
      redirect_to game_path(@game)
    else
      render "index"
    end
  end

  def edit
    @game = Game.find(params[:id])
    if @game.user == current_user
      render :edit
    else
      redirect_to games_path
    end
  end

  def update
    @game = Game.find(params[:id])
    if @game.update(game_params)
      flash[:notice]="ゲーム情報を編集しました！"
      redirect_to game_path(@game.id)
    else
      render :edit
    end
  end


  def approve
    if @request.approve!
      redirect_to new_game_path, notice: 'リクエストが承認されました。'
    else
      redirect_to admin_requests_path, alert: 'リクエストの承認に失敗しました。'
    end
  end

  def reject
    if @request.reject!
      redirect_to admin_requests_path, notice: 'リクエストが拒否されました。'
    else
      redirect_to admin_requests_path, alert: 'リクエストの拒否に失敗しました。'
    end
  end

  private

  def game_params
    params.require(:game).permit(:title, :status, :genre, :release_date, :developer, :price)
  end

  def set_request
    @request = Request.find(params[:id])
  end

  def authenticate_admin
    redirect_to root_path, alert: "アクセス権限がありません。" unless current_user&.admin?
  end
end
