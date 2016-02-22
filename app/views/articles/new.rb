class ArticlesNewView

  def select_article
    puts "Would you like to browse articles by magazine or by journalist (Enter 'Magazine' or 'Journalist')?"
    result = gets.chomp
    while result != "Journalist" && result != "Magazine"
      puts "Please select 'Magazine' or 'Journalist'"
      result = gets.chomp
    end
    result
  end

end
