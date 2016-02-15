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

  def self.index
    self.all.each.with_index(1) do |magazine, idx|
      puts "#{idx}. #{magazine.name}"
    end
  end

  def self.magazine_articles(magazine_name)
    self.all.find {|magazine| magazine.name == magazine_name}.articles.each.with_index(1) do |article, idx|
      "#{idx}. #{article.title}"
    end
  end

end
