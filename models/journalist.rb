class Journalist
  attr_reader :name, :articles

  def initialize(name)
    @name = name
    @articles = []
  end

  def write_article_by_title(article_title)
    new_article = Article.new(article_title)
    self.articles << new_article
    new_article.journalist = self
  end

  def submit_article(article_title, magazine_title)
    if find_article_by_title(article_title)
      article = find_article_by_title(article_title)
      article.assign_to_magazine(magazine_title)
    end
  end

  def find_article_by_title(article_title)
    self.articles.find { |article|  article.title == article_title}
  end

end
