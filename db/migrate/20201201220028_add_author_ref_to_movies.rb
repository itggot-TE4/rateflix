class AddAuthorRefToMovies < ActiveRecord::Migration[6.0]
  def up
    # add reference with NULL allowed
    add_reference :movies, :author, foreign_key: true

    # add appropriate author record to each existing movie
    Movie.find_each do |movie|
      movie.update!(author: Author.first)
    end

    # add NOT NULL constraint
    change_column_null :movies, :author_id, false
  end

  def down
    remove_reference :movies, :author, foreign_key: true
  end
end
