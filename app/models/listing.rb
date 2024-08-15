class Listing < ApplicationRecord
  include PgSearch::Model

  # Define the searchable scope here
  pg_search_scope :search_by_game_genres_platforms_and_name,
    associated_against: {
      game: [:genres, :platforms, :name]
    },
    using: {
      tsearch: { prefix: true } # Enable prefix searching
    }

  belongs_to :user
  belongs_to :game
  belongs_to :rental
end
