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

end
