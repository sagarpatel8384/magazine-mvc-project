class MagazinesController
  def index
    Magazine.index
  end

  def show
    view = MagazineNewView.new
    magazine_name = view.render
    Magazine.magazine_articles(magazine_name)
  end

end
