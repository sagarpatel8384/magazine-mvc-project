class Journalist
  extend Databaseable::ClassMethods
  include Databaseable::InstanceMethods
  attr_accessor(*self.public_attributes)
  attr_accessor :id

   def articles
    sql = <<-SQL
      SELECT articles.* FROM articles
      JOIN journalists 
      ON articles.journalist_id = journalists.id
      WHERE articles.journalist_id = ?
    SQL

    articles = DB[:conn].execute(sql, self.id)

   articles.map do |article|
      Article.objects_from_row(article)
    end
  end

end
