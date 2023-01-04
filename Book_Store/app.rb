require_relative 'lib/database_connection'
require_relative 'lib/book_repository'
require_relative 'lib/book'

DatabaseConnection.connect('book_store')

repo = BooksRepository.new

library = repo.all

library.each do |book|
  puts book.id + " " + book.title + " " + book.author_name
end
