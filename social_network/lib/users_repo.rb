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

  def find(id)
    sql = "SELECT * FROM users WHERE id = #{id}"
    results = DatabaseConnection.exec_params(sql, [])
    user = User.new
    user.id = results[0]['id']
    user.user_name = results[0]['user_name']
    user.email_address = results[0]['email_address']
    return user
  end

  def add(user_name, email_address)
    sql = "INSERT INTO users (user_name, email_address) VALUES ('#{user_name}', '#{email_address}');"
    result = DatabaseConnection.exec_params(sql,[])
    return result
  end

end
