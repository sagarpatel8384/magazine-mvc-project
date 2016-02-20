class Journalist
  attr_reader :name, :articles
  @@journalists = []

  def self.all
    @@journalists
  end

  def self.find_journalist_by_name(name)
    self.all.find { |journalist| journalist.name == name }
  end

  def initialize(name)
    @name = name
    @articles = []
    @@journalists << self
  end

  def write_article_by_title(article_title, article_body)
    new_article = Article.new(article_title, article_body)
    self.articles << new_article
    new_article.journalist = self
    new_article
  end

  def submit_article(article_title, magazine_title)
    article = find_article_by_title(article_title)
      if article 
      article.assign_to_magazine(magazine_title)
      else 
        
      end
  end

  def find_article_by_title(article_title)
    self.articles.find { |article|  article.title == article_title}
  end

end
