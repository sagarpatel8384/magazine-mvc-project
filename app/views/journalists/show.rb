class JournalistsShowView

  def render_journalist
    puts "Please enter your name."
    gets.chomp
  end

  def render_article
    puts "What is the title of the article you would like to publish?"
    gets.chomp
  end

  def render_magazine
    puts "What is the name of the magazine you would like to publish to?"
    gets.chomp
  end

  def get_article_to_view
    puts "Which article would you like to read (Enter Title)?"
    gets.chomp
  end
end
