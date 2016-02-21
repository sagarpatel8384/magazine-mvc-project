class JournalistsPublishView

  def render(journalist, article, magazine)
    puts "Thank you #{journalist.name} for submitting '#{article.title}' to '#{magazine.name}'."
  end

end
