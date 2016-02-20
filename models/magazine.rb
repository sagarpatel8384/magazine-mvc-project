class Magazine
  attr_reader :name, :articles
  @@magazines = []

  def initialize(name)
    @name = name
    @articles = []
    @@magazines << self
  end

  def self.all
    @@magazines
  end

  def articles=(article)
    @articles << article
  end

  def self.magazine_articles(magazine_name)
    magazine = self.all.find {|magazine| magazine.name == magazine_name}
    if magazine
      magazine.articles.each do |article|
        article.title
      end
    end
  end

end
