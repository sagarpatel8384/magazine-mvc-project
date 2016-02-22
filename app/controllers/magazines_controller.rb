class MagazinesController

  def index
    @magazines = Magazine.all
    self.render("magazine/index")
  end

  def show
    view = MagazinesNewView.new
    magazine_name = view.select_magazine
    @article_names = Article.magazine_articles(magazine_name)
    self.render("magazine/show")
    view = MagazinesShowView.new
    view.get_article_to_view
  end

  def render(file)
    file_name = "/Users/gmoseson/Development/flatiron/orm-magazine-mvc-project/magazine-mvc-project-master/app/views/template/#{file}.html.erb"
    content = File.read(file_name)
    template = ERB.new(content)
    output_content = template.result(binding)
    output_file = "/Users/gmoseson/Development/flatiron/orm-magazine-mvc-project/magazine-mvc-project-master/app/views/output/#{file}.html"
    File.write(output_file, output_content)
    `open -a "Google Chrome" #{output_file}`
  end

end
