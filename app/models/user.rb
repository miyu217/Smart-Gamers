class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :profile_image
  has_many :games
  has_many :favorites
  has_many :favorite_games, through: :favorites, source: :game
  has_many :reviews, dependent: :destroy
  has_many :requests, dependent: :destroy

  validates :name, presence: true, length: { minimum: 2,maximum: 20}, uniqueness: true
  validates :introduction, length: { maximum: 50}

  def favorited?(game)
    favorite_games.exists?(id: game.id)
  end
end
