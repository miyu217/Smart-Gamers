class GamesController < ApplicationController
  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    @game.user_id = current_user.id
    if @game.save
      flash[:notice]="You have created game successfully."
      redirect_to game_path(@game)
    else
      @games = Game.all
      @user = User.find(current_user.id)
      render "index"
    end
  end

  def index
    @games = Game.all
    @user = User.find(current_user.id)
    @game = Game.new
  end

  def show
    @game = Game.find(params[:id])
    @user = @game.user
    @review = Review.new
    @reviews = @game.reviews
  end

  def edit
     @game = Game.find(params[:id])
    if @game.user == current_user
      render "edit"
    else
      redirect_to games_path
    end
  end

  def update
    @game = Game.find(params[:id])
    @game.user_id = current_user.id
    if @game.update(game_params)
      flash[:notice]="You have updated game successfully."
      redirect_to game_path(@game.id)
    else
      render :edit
    end
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    redirect_to games_path
  end

  def search
    @query = params[:query]
    @games = Game.where("title LIKE ? OR genre LIKE ?", "%#{@query}%", "%#{@query}%")
    @user = User.find(current_user.id)
  end

  private
  def game_params
    params.require(:game).permit(:title, :status, :genre)
  end
end
