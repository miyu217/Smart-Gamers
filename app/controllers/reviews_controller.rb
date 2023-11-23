class ReviewsController < ApplicationController
  def create
    @game = Game.find(params[:game_id])
    @review = @game.reviews.build(review_params)
    @review.user = current_user

    if @review.save
      redirect_to @game, notice: "レビューが投稿されました。"
    else
      @reviews = @game.reviews
      render "games/show"
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end