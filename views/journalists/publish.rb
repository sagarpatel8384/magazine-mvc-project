class JournalistsPublishView

  def render(journalist, article_title, magazine_title)
    puts "Thank you #{journalist.name} for submitting #{article_title} to #{magazine_title}."
  end

end
