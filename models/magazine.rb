require_relative "../config/environment.rb"
require 'active_support/inflector'
require_relative 'interactive_record.rb'

class Magazine < InteractiveRecord
  attr_accessor :name
  # attr_accessor(*self.public_attributes)
  attr_reader :id

  def self.magazine_articles(magazine_name)
    sql = <<-SQL
      SELECT articles.id, articles.title, articles.body, articles.magazine_id, articles.journalist_id
      FROM magazines
      JOIN articles
      ON articles.magazine_id = magazines.id
      WHERE magazines.name = ?
    SQL
    articles = DB[:conn].execute(sql, magazine_name)
    articles.map do |article|
      binding.pry
      Article.new_from_database(article)
    end

    # Article.all.select do |article|
    #   article.magazine_id = magazines.id
    # end
  end

end
