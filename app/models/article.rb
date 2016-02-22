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
    articles = articles.map do |article|
      self.objects_from_row(article)
    end
    articles
  end

  # def self.show_article_body(title)
  #   article = self.find_by(title: title)
  # end

end
