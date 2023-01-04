require_relative './album'

class AlbumRepository
  def all
    albums = []
    sql = 'SELECT * FROM albums;'
    result_set = DatabaseConnection.exec_params(sql, [])

    result_set.each do |record|
      album = Album.new

      album.id = record['id']
      album.title = record['title']
      album.release_year = record['release_year']
      album.artist_id = record['artist_id']
      albums << album
    end
    return albums
  end

  def find(title)
    sql = 'SELECT * FROM albums WHERE title=$1;'
    params = [title]
    result_title = DatabaseConnection.exec_params(sql, params)
    record = Album.new
    record.id = result_title[0]['id']
    record.release_year = result_title[0]['release_year']
    record.title = result_title[0]['title']
    return record.id + " - " + record.title + " - " + record.release_year
  end

  def add(title, release_year)
    sql = "INSERT INTO albums (title, release_year) VALUES ('#{title}', '#{release_year}');"
    title_to_add = DatabaseConnection.exec_params(sql,[])
  end
end