class Article
  attr_reader :title
  attr_accessor :journalist, :magazine

  def initialize(title)
    @title = title
  end

  def assign_to_magazine(magazine_title)
    if Magazine.all.find { |magazine| magazine.name == magazine_title }
      magazine = Magazine.all.find { |magazine| magazine.name == magazine_title }
      self.magazine = magazine
      magazine.articles = self
    end
  end

end
