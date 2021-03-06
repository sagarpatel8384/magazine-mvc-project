class Article
  extend Databaseable::ClassMethods
  include Databaseable::InstanceMethods
  attr_accessor(*self.public_attributes)
  attr_accessor :id

  def self.magazine_articles(magazine)
    sql = <<-SQL
    SELECT * FROM articles
    JOIN magazines
    ON articles.magazine_id = magazines.id
    WHERE magazines.name = ?
    SQL

    articles = DB[:conn].execute(sql, "#{magazine}")
    articles.map { |article| self.objects_from_row(article) }
  end

  def journalist
    sql = <<-SQL
      SELECT journalists.* FROM journalists
      JOIN articles
      ON articles.journalist_id = journalists.id
      WHERE articles.journalist_id = ?
    SQL

    journalist = DB[:conn].execute(sql, self.journalist_id).first
    Journalist.objects_from_row(journalist)
  end

end
