class Game < ApplicationRecord
  include PgSearch::Model

  before_save :update_searchable_index

  pg_search_scope :search_by_name_genres_platforms,
    against: [:name, :genres, :platforms],
    using: {
      tsearch: { prefix: true } # Allows partial matches, e.g., "Call" will match "Call of Duty"
    }

    def update_searchable_index
      self.searchable_index =
        "to_tsvector('english', coalesce(name, '') || ' ' || coalesce(genres, '') || ' ' || coalesce(platforms, ''))"
    end
end
