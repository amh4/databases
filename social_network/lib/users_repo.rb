require_relative 'users'

class UsersRepository

  def all
    sql = 'SELECT * FROM users'
    results = DatabaseConnection.exec_params(sql, [])
    users = []
    results.each do |record|
      user = User.new

      user.id = record['id']
      user.user_name = record['user_name']
      user.email_address = record['email_address']
      users << user
    end
    return users
  end
end