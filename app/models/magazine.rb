class Magazine
  extend Databaseable::ClassMethods
  include Databaseable::InstanceMethods
  attr_accessor(*self.public_attributes)
  attr_accessor :id

  def magazine_articles
    sql = <<-SQL
      SELECT articles.title FROM articles
      INNER JOIN magazines
      ON magazines.id = articles.magazine_id
      WHERE magazines.id = #{self.id}
    SQL
    articles = DB[:conn].execute(sql)
  end

end
