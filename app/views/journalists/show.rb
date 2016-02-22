class JournalistsShowView

  def render_journalist
    puts "Please enter your name."
    Journalist.all.each.with_index(1) { |journalist, index| puts "#{index}. #{journalist.name}" }
    print "Enter Journalist Name: "
    gets.chomp
  end

  def render_article
    puts "What is the title of the article you would like to publish?"
    Article.all.each.with_index(1) { |article, index| puts "#{index}. #{article.title}" }
    print "Which article would you like to publish? "
    gets.chomp
  end

  def render_magazine
    puts "What is the name of the magazine you would like to publish to?"
    Magazine.all.each.with_index(1) { |magazine, index| puts "#{index}. #{magazine.name}" }
    print "Enter Magazine Name: "
    gets.chomp
  end

  def get_article_to_view
    puts "Which article would you like to read (Enter Title)? "
    gets.chomp
  end
end
