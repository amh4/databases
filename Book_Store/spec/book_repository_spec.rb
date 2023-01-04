require_relative '../lib/book_repository'

def reset_books_table
  seed_sql = File.read('spec/book_store_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'book_store_test' })
  connection.exec(seed_sql)
end

describe BooksRepository do
  before(:each) do 
    reset_books_table
  end

  it "returns all records from the db" do
    library = BooksRepository.new
    books = library.all
    expect(books[0].id).to eq "1"
    expect(books[0].title).to eq "Dune"
    expect(books[0].author_name).to eq "Frank Herbert"
    expect(books[1].id).to eq "2"
    expect(books[1].title).to eq "Unexpected Joy of Being Sober"
    expect(books[1].author_name).to eq "Catherine Grey"
  end
end