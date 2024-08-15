class Game < ApplicationRecord
  include PgSearch::Model
  has_many :listings
  pg_search_scope :search_by_game_genres_platforms_and_name,
    against: [:genres, :platforms, :name],
    using: {
      tsearch: { prefix: true } # Enable prefix searching
    }
end
