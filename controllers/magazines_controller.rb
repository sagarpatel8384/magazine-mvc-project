class MagazinesController
  
  def index
    @magazines = Magazine.all
    render("magazines/index")
  end

  def show
    view = MagazinesNewView.new
    @magazine_name = view.render
    if Magazine.magazine_articles(@magazine_name) == nil
      render("magazines/not_found")
    elsif Magazine.magazine_articles(@magazine_name).empty?
      render("magazines/show_error")
    else
      @article_names = Magazine.magazine_articles(@magazine_name)
      render("magazines/show_articles")
      view = MagazinesShowView.new
      view.render
    end
  end

  def render(file)
    file_name = "/Users/gmoseson/Development/flatiron/magazine-mvc-project/views/templates/#{file}.html.erb"
    content = File.read(file_name)
    template = ERB.new(content)
    output_content = template.result(binding)
    output_file = "/Users/gmoseson/Development/flatiron/magazine-mvc-project/views/output/#{file}.html"
    File.write(output_file, output_content)

    `open -a "Google Chrome" #{output_file}`
  end

end
