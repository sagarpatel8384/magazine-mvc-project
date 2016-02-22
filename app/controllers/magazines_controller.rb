class MagazinesController

  def index
    @magazines = Magazine.all
    self.render("magazine/index")
  end

  def show
    view = MagazinesNewView.new
    magazine_name = view.render
    magazine = Magazine.find_by(name: magazine_name)

    if magazine
      @article_titles = magazine.magazine_articles.flatten
      self.render("magazine/show")
      article_name = MagazinesShowView.new.render
      Article.find_by(title: article_name)
    else
      self.render("magazine/error")
    end
  end

  def render(file)
    file_name = "/Users/sagarpatel/Documents/Flatiron/Labs/Ruby/magazine-mvc-project/app/views/template/#{file}.html.erb"
    content = File.read(file_name)
    template = ERB.new(content)
    output_content = template.result(binding)
    output_file = "/Users/sagarpatel/Documents/Flatiron/Labs/Ruby/magazine-mvc-project/app/views/output/#{file}.html"
    File.write(output_file, output_content)
    `open -a "Google Chrome" #{output_file}`
  end

end
