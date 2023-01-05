require_relative 'posts'
class PostsRepository
  def all
    sql = 'SELECT * FROM posts'
    results = DatabaseConnection.exec_params(sql, [])
    posts = []
    results.each do |record|
      post = Post.new
      post.id = record['id']
      post.title = record['title']
      post.content = record['content']
      posts << post
    end
    return posts
  end

  def find(id)
    sql = "SELECT * FROM posts WHERE id=#{id}"
    result = DatabaseConnection.exec_params(sql, [])

    post = Post.new

    post.id = result[0]['id']
    post.title = result[0]['title']
    post.content = result[0]['content']
    return post
  end

  def add(title, content)
    sql = "INSERT INTO posts (title, content) VALUES ('#{title}', '#{content}');"
    result = DatabaseConnection.exec_params(sql,[])
    return result
  end
end