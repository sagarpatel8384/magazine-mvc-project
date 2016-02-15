class JournalistsCreateView
  def render
    puts "What is the title of your article?"
    title = gets.chomp
    puts "Thank you for writing #{title}."
    title
  end
end
