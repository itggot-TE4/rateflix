class AddAuthorRefToMovies < ActiveRecord::Migration[6.0]
  def change
    add_reference :movies, :author, null: false, foreign_key: true
  end
end
