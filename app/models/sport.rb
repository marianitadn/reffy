class Sport < ActiveRecord::Base
  attr_accessible :name, :type

  has_many :tournaments, foreign_key: 'sport_id'
  has_many :games, through: :team_games

   validates :name , presence: true,
					 length: {maximum: 30}
   
end
