class MagazinesShowView

  def error
    puts "There are currently no articles."
  end

  def get_article_to_view
    puts "Which article would you like to read (Enter Title)?"
    gets.chomp
  end

end
