class Author < ApplicationRecord
    has_many :movies

    def self.unknown
        return Author.where(name: "UNKNOWN").first_or_create
    end
end
