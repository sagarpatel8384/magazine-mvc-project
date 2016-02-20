
class Article
  attr_reader :title
  attr_accessor :body, :journalist, :magazine
  @@articles = []

  def initialize(title, body)
    @title = title
    @body = body
    @@articles << self
  end

  def assign_to_magazine(magazine_title)
    magazine = Magazine.all.find { |magazine| magazine.name == magazine_title }
    if magazine
      self.magazine = magazine
      magazine.articles = self
    end
    
  end

  def self.all
    @@articles
  end

  def self.show_article_body(article_title)
    article = self.all.find { |article| article.title == article_title }
    if article
      article.body
    end
  end

end
