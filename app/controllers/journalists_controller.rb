class JournalistsController

  def new
    journalist = JournalistsNewView.new
    name = journalist.render
    journalist = Journalist.new(name: name)
    journalist.save
  end

  def create_article(journo_id)
    journalist_article = JournalistsCreateView.new
    title = journalist_article.render_title
    journalist_article = JournalistsCreateView.new
    body = journalist_article.render_body
    article = Article.new(title: title, body: body, journalist_id: journo_id)
    article.save
  end

  def get_journalist
    view = JournalistsShowView.new
    name = view.render_journalist
    journalist = Journalist.find_by(name: name)
  end

  def get_article
    view = JournalistsShowView.new
    title = view.render_article
    article = Article.find_by(title: title)
  end

  def get_magazine
    view = JournalistsShowView.new
    name = view.render_magazine
    magazine = Magazine.find_by(name: name)
  end

  def publish(journalist, article, magazine)
    article.magazine_id = magazine.id
    article.update
    view = JournalistsPublishView.new
    view.render(journalist, article, magazine)
  end

  def index
    @journalists = Journalist.all
    self.render("journalist/index")
  end

  def show
    view = JournalistsNewView.new
    journalist_name = view.select_journalist
    @journalist = Journalist.find_by(name: journalist_name)
    self.render("journalist/show")
    view = JournalistsShowView.new
    view.get_article_to_view
  end

  def render(file)
    file_name = "../magazine-mvc-project/app/views/template/#{file}.html.erb"
    content = File.read(file_name)
    template = ERB.new(content)
    output_content = template.result(binding)
    output_file = "../magazine-mvc-project/app/views/output/#{file}.html"

    File.write(output_file, output_content)
    `open -a "Google Chrome" #{output_file}`
  end

end
