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
end
