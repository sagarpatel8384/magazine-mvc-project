class JournalistsNewView

  def render
    puts "Please enter your name."
    gets.chomp
  end

  def select_journalist
    puts "Which journalist's articles would you like to browse? (Enter Journalist Name)"
    gets.chomp
  end
end
