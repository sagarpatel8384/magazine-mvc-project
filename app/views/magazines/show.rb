class MagazinesShowView

  def error
    puts "There are currently no articles."
  end

  def get_article_to_view
    puts "Which article would you like to read (Enter Title)?"
    all = Article.all
    valid_argument(all, "article", "title")
  end

  def valid_argument(all, attribute, column)
    begin
      print "Please enter a valid #{attribute}: "
      result = gets.chomp
    end while !all.find { |element| element.send("#{column}") == result }
    result
  end

end
