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

end
