class Task < ApplicationRecord
	include PgSearch
	pg_search_scope :search_description, against: [:description],
    using: {
      tsearch: {
        prefix: true
      }
    }

	belongs_to :user

	validates :description, presence: true
end
