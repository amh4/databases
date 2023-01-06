require_relative 'database_connection'
require_relative 'album_repository'
require_relative 'album'

class Application

  # The Application class initializer
  # takes four arguments:
  #  * The database name to call `DatabaseConnection.connect`
  #  * the Kernel object as `io` (so we can mock the IO in our tests)
  #  * the AlbumRepository object (or a double of it)
  #  * the ArtistRepository object (or a double of it)

  def initialize(database_name, io, album_repository)
    DatabaseConnection.connect(database_name)
    @io = io
    @album_repository = album_repository
  end

  def run
    # Use `@io.puts` or `@io.gets` to
    # write output and ask for user input.


    # Get user input
    # If statement to select method from classes
    # Inside if statements take user arg
    # Pass into method
    # return

    @io.puts "What would you like to do?"
    @io.puts "1 - Show me all albums"
    @io.puts "2 - Find a specific album"
    @io.puts "3 - Add an album"
    main_menu_choice = @io.gets

    if main_menu_choice == "1"
      new_repo = AlbumRepository.new
      new_repo.all

    elsif  main_menu_choice == "2"
      all_repo = AlbumRepository.new
      @io.puts "What title do you want to look for?"
      find_choice = @io.gets
      return all_repo.find(find_choice)

    end
  end
end

if __FILE__ == $0
  app = Application.new(
    'music_library',
    Kernel,
    AlbumRepository.new,
    ArtistRepository.new
  )
  app.run
end