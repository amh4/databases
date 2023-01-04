require_relative '../lib/album_repository'
require_relative '../lib/album'

def reset_music_table
  seed_sql = File.read('spec/seeds_albums.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
  connection.exec(seed_sql)
end

describe AlbumRepository do
  before(:each) do 
    reset_music_table
  end

  it 'returns all albums' do
    repo = AlbumRepository.new
    albums = repo.all
    expect(albums.first.id).to eq '1'
    expect(albums.first.title).to eq "Doolittle"
    expect(albums.first.release_year).to eq "1998"
    expect(albums.first.artist_id).to eq "1"
  end

  it 'find entry based on title' do
    repo = AlbumRepository.new
    expect(repo.find("Doolittle")).to eq "The title is Doolittle and the year is 1998"
  end

  it 'takes a title and release year and adds it to the table' do
    repo = AlbumRepository.new
    repo.add('Hello','1980')
    albums = repo.all
    expect(albums[-1].title).to eq 'Hello'
    expect(albums[-1].release_year).to eq '1980'
  end
end