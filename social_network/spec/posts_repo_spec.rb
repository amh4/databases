require_relative '../lib/posts_repo'

def reset_table
  seed_sql = File.read('spec/socials_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'social_network_test' })
  connection.exec(seed_sql)
end

RSpec.describe PostsRepository do
  before(:each) { reset_table }

  it 'returns all posts from db' do
    repo = PostsRepository.new
    results = repo.all

    expect(results[0].id).to eq '1'
    expect(results[0].title).to eq 'Title1'
    expect(results[0].content).to eq 'Content1'

    expect(results[1].id).to eq '2'
    expect(results[1].title).to eq 'Title2'
    expect(results[1].content).to eq 'Content2'
  end
end
