class JournalistsCreateView
  def render_title
    puts "What is the title of your article?"
    title = gets.chomp
    puts "Thank you for writing #{title}."
    title
  end

  def render_body
    puts "Type the body of your article here."
    body = gets.chomp
    puts "Thank you for writing your article."
  end

end
