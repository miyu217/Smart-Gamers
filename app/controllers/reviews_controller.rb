class ReviewsController < ApplicationController
  before_action :set_game
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  def create
    @review = @game.reviews.build(review_params)
    @review.user = current_user
    if @review.save
      redirect_to game_review_path(@game, @review), notice: "レビューが投稿されました。"
    else
      @reviews = @game.reviews
      render "games/show"
    end
  end

  def show
    @review = Review.find(params[:id])
    @user = User.find(current_user.id)
  end

  def edit
    @review = Review.find(params[:id])
    if @review.user == current_user
      render "edit"
    else
      redirect_to game_path(@game)
    end
  end

  def update
    if @review.update(review_params)
      redirect_to game_review_path(@game, @review), notice: "レビューが更新されました。"
    else
      render :edit
    end
  end

  def destroy
    @review.destroy
    redirect_to game_path(@game), notice: "レビューが削除されました。"
  end

  private

  def set_game
    @game = Game.find(params[:game_id])
  end

  def set_review
    @review = @game.reviews.find_by(id: params[:id])
    unless @review
      flash[:alert] = "レビューが見つかりませんでした。"
      redirect_to game_path(@game)
    end
  end

  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end