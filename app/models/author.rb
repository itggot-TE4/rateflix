class Author < ApplicationRecord
    has_many :movies

    scope :except_unknown, -> { where.not(name: "UNKNOWN") }

    def self.unknown
        return Author.where(name: "UNKNOWN").first_or_create
    end
end
