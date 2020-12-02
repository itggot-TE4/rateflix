class Movie < ApplicationRecord
    has_many :reviews
    belongs_to :author

    validates :title, presence: true, uniqueness: { case_sensitive: false }
    validates :author, presence: true
end
