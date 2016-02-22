class MagazinesShowView
  include Validateable
  
  def error
    puts "There are currently no articles."
  end

  def get_article_to_view
    puts "Which article would you like to read (Enter Title)?"
    all = Article.all
    valid_argument(all, "article", "title")
  end

end
