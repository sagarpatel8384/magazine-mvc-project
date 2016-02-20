["Time", "People", "New Yorker", "Nylon", "Wired"].each do |mag|
  magazine = Magazine.new(name: mag)
  magazine.save
end

article = Article.new(title: "Hello", body: "Goodbye", magazine_id: 1)
article.save

article2 = Article.new(title: "Hello2", body: "Goodbye2", magazine_id: 1)
article2.save
