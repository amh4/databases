require_relative '../lib/users_repo'

def reset_table
  seed_sql = File.read('spec/socials_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'social_network_test' })
  connection.exec(seed_sql)
end

RSpec.describe UsersRepository do
  before(:each) { reset_table }

  it 'returns all users from db ' do
    repo = UsersRepository.new

    results = repo.all

    expect(results[0].id).to eq '1'
    expect(results[0].user_name).to eq 'username1'
    expect(results[0].email_address).to eq 'email1'

    expect(results[1].id).to eq '2'
    expect(results[1].user_name).to eq 'username2'
    expect(results[1].email_address).to eq 'email2'
  end

  it 'finds a user from a given id' do
    repo = UsersRepository.new
    search = repo.find(1)
    expect(search.user_name).to eq 'username1'
    expect(search.email_address).to eq 'email1'
  end

  it 'creates a user' do
    repo = UsersRepository.new
    repo.add('user3', 'email3')
    results = repo.all
    expect(results[-1].id).to eq '3'
    expect(results[-1].user_name).to eq 'user3'
    expect(results[-1].email_address).to eq 'email3'
  end

  it 'deletes based on given id' do
    repo = UsersRepository.new
    before = repo.all.length
    repo.delete(1)
    after = repo.all.length
    expect(after).to eq (before - 1)
  end
end

#  create user, find user, delete user, delete posts
