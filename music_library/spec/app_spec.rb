require_relative '../lib/app.rb'

def reset_music_table
  seed_sql = File.read('spec/seeds_albums.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
  connection.exec(seed_sql)
end

describe Application do
  before(:each) do 
    reset_music_table
  end

  it "takes user input and returns all albums" do
    io = double :io
    album_repo = AlbumRepository.new
    db_name = 'music_library_test'
    new_app = Application.new(db_name, io, album_repo )
  

    allow(io).to receive(:puts).with("What would you like to do?")
    allow(io).to receive(:puts).with ("1 - Show me all albums")
    allow(io).to receive(:puts).with ("2 - Find a specific album")
    allow(io).to receive(:puts).with ("3 - Add an album")

    expect(io).to receive(:gets).and_return("1")
    
    results = new_app.run

    expect(results[0].id).to eq "1"
    expect(results[0].title).to eq "Doolittle"
    expect(results[0].release_year).to eq "1998"
    expect(results[0].artist_id).to eq "1"

    expect(results[1].id).to eq "2"
    expect(results[1].title).to eq "Best hits"
    expect(results[1].release_year).to eq "2000"
    expect(results[1].artist_id).to eq "1"
  end

  it "takes user input and finds album" do
    io = double :io
    album_repo = AlbumRepository.new
    db_name = 'music_library_test'
    new_app = Application.new(db_name, io, album_repo )
  

    allow(io).to receive(:puts).with("What would you like to do?")
    allow(io).to receive(:puts).with ("1 - Show me all albums")
    allow(io).to receive(:puts).with ("2 - Find a specific album")
    allow(io).to receive(:puts).with ("3 - Add an album")
    allow(io).to receive(:puts).with ("What title do you want to look for?")

    expect(io).to receive(:gets).and_return("2", "Doolittle")
    
    results = new_app.run
    expect(results).to eq "1 - Doolittle - 1998"
  end

  it "takes user input and finds album" do
    io = double :io
    album_repo = AlbumRepository.new
    db_name = 'music_library_test'
    new_app = Application.new(db_name, io, album_repo )
  

    allow(io).to receive(:puts).with("What would you like to do?")
    allow(io).to receive(:puts).with ("1 - Show me all albums")
    allow(io).to receive(:puts).with ("2 - Find a specific album")
    allow(io).to receive(:puts).with ("3 - Add an album")
    allow(io).to receive(:puts).with ("What title do you want to look for?")

    expect(io).to receive(:gets).and_return("2", "Doolittle")
    
    results = new_app.run
    expect(results).to eq "1 - Doolittle - 1998"
  end

  it "takes user input and adds an album" do
    io = double :io
    album_repo = AlbumRepository.new
    db_name = 'music_library_test'
    new_app = Application.new(db_name, io, album_repo )
  

    allow(io).to receive(:puts).with("What would you like to do?")
    allow(io).to receive(:puts).with ("1 - Show me all albums")
    allow(io).to receive(:puts).with ("2 - Find a specific album")
    allow(io).to receive(:puts).with ("3 - Add an album")
    allow(io).to receive(:puts).with ("What title do you want to look for?")
    allow(io).to receive(:puts).with ("Enter a title")
    allow(io).to receive(:puts).with ("Enter a release year")

    expect(io).to receive(:gets).and_return("3", "Stadium Arcadium", 2010)
    
    results = new_app.run
    albums = album_repo.all
    expect(albums[-1].title).to eq "Stadium Arcadium"
    expect(albums[-1].release_year).to eq "2010"
  end
end