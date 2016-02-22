class JournalistsShowView
  include Validateable

  def render_journalist
    puts "Please enter your name."
    all = Journalist.all.each.with_index(1) { |journalist, index| puts "#{index}. #{journalist.name}" }
    print "Enter Journalist Name: "
    valid_argument(all, "journalist", "name")
  end

  def render_article
    puts "What is the title of the article you would like to publish?"
    all = Article.all.each.with_index(1) { |article, index| puts "#{index}. #{article.title}" }
    print "Which article would you like to publish? "
    valid_argument(all, "article", "title")
  end

  def render_magazine
    puts "What is the name of the magazine you would like to publish to?"
    all = Magazine.all.each.with_index(1) { |magazine, index| puts "#{index}. #{magazine.name}" }
    print "Enter Magazine Name: "
    valid_argument(all, "magazine", "name")
  end

  def get_article_to_view
    puts "Which article would you like to read (Enter Title)?"
    gets.chomp
  end
end
