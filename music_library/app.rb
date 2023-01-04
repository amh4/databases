require_relative 'lib/database_connection'
require_relative 'lib/album_repository'
require_relative 'lib/album'

DatabaseConnection.connect('music_library')

# Perform a SQL query on the database and get the result set.
repo = AlbumRepository.new

album = repo.find("Lover")

puts album