class JournalistsController

  def new
    journalist = JournalistsNewView.new
    name = journalist.render
    journalist = Journalist.new(name)
  end

  def create_article(journalist)
    journalist_article = JournalistsCreateView.new
    title = journalist_article.render
    journalist.write_article_by_title(title)
  end

  def get_journalist
    view = JournalistsShowView.new
    name = view.render_journalist
    journalist = Journalist.find_journalist_by_name(name)
  end

  def get_article
    view = JournalistsShowView.new
    article = view.render_article
  end

  def get_magazine
    view = JournalistsShowView.new
    magazine = view.render_magazine
  end

  def publish(journalist, article_title, magazine_title)
    journalist.submit_article(article_title, magazine_title)
    view = JournalistsPublishView.new
    view.render(journalist, article_title, magazine_title)
  end

end
