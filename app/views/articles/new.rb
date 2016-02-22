class ArticlesNewView

  def select_article
    puts "Would you like to browse articles by magazine or by journalist (Enter 'Magazine', Journalist' or 'Main Menu')?"
    result = gets.chomp
    while result != "Journalist" && result != "Magazine" && result != "Main Menu"
      puts "Please select 'Magazine' or 'Journalist'"
      result = gets.chomp
    end
    result
  end

end
