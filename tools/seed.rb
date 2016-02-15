["Time", "People", "New Yorker", "Nylon", "Wired"].each do |magazine|
  Magazine.new(magazine)
end

greta = Journalist.new("Greta")
sammy = Journalist.new("Sammy")

greta.write_article_by_title("Ruby on Rails Tutorial", "Time")
greta.write_article_by_title("Python Tutorial", "Wired")

sammy.write_article_by_title("HTML Tutorial", "New Yorker")
sammy.write_article_by_title("CSS Tutorial", "Nylon")
