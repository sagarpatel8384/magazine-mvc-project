class MagazinesShowView

  def error
    puts "There are currently no articles."
  end

  def render
    puts "Which article would you like to read (Enter Title)?"
    gets.chomp
  end

  def show_article(articles)
    articles.each.with_index(1) { |article, idx| puts "#{idx}. #{article.title}" }
  end

end
