class ArticlesController

  def show(article_title)
    @article_title = article_title
    @body = Article.show_article_body(article_title)
    render("articles/show")
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