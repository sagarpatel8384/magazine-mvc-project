class MagazinesController
  def index
    Magazine.index
  end

  def show
    view = MagazinesNewView.new
    magazine_name = view.render
    # binding.pry
    if Magazine.magazine_articles(magazine_name).empty?
      view = MagazinesShowView.new
      view.error
    else
      article_names = Magazine.magazine_articles(magazine_name)
      view = MagazinesShowView.new
      view.show_article(article_names)

      view = MagazinesShowView.new
      view.render
    end
  end

end
