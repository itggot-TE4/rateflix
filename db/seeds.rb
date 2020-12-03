movies_with_authors = [{
  title: 'Star Wars',
  author: 'Jar Jar Binks',
}, {
  title: 'Lord of the Rings',
  author: 'Frodo Baggins'
}]
Movie.create!(movies_with_authors.map {
  | movie | {
    title: movie[:title],
    author: Author.create(name: movie[:author])
  }
})

user = User.create!(:email => 'a@a.a', :password => '123123', :password_confirmation => '123123')

Review.create(user: user, movie: Movie.first, rating: 5, text: "Lorem Ipsum")
