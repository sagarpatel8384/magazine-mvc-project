class MagazinesController

  def index
    @magazines = Magazine.all
    self.render("magazine/index")
  end

  def show
    view = MagazinesNewView.new
    magazine_name = view.render
    if Magazine.magazine_articles(magazine_name).empty?
      self.render("magazine/error")
    else
      @article_names = Magazine.magazine_articles(magazine_name)
      self.render("magazine/show")
      article_names = Magazine.magazine_articles(magazine_name)
      view = MagazinesShowView.new
      view.show_article(article_names)

      view = MagazinesShowView.new
      view.render
    end
  end

  def render(file)
    file_name = "/Users/sagarpatel/Documents/Flatiron/Labs/Ruby/magazine-mvc-project/views/template/#{file}.html.erb"
    content = File.read(file_name)
    template = ERB.new(content)
    output_content = template.result(binding)
    output_file = "/Users/sagarpatel/Documents/Flatiron/Labs/Ruby/magazine-mvc-project/views/output/#{file}.html"
    File.write(output_file, output_content)
    `open -a "Google Chrome" #{output_file}`
  end

end
