class Author < ApplicationRecord
    has_many :movies
    validates :name, presence: true, uniqueness: { case_sensitive: false }

    scope :except_unknown, -> { where.not(name: "UNKNOWN") }

    def self.unknown
        return Author.where(name: "UNKNOWN").first_or_create
    end
end
