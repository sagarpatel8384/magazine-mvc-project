# JOURNALISTS
sagar = { name: "Sagar" }
saied = { name: "Saied" }
sammy = { name: "Sammy" }
greta = { name: "Greta" }

@sagar = Journalist.new(sagar)
@saied = Journalist.new(saied)
@sammy = Journalist.new(sammy)
@greta = Journalist.new(greta)


@sagar.save
@saied.save
@sammy.save
@greta.save

# MAGAZINES
time = { name: "Time Magazine" }
people = { name: "People Magazine" }
new_yorker = { name: "The New Yorker" }
forbes = { name: "Forbes" }

@time = Magazine.new(time)
@people = Magazine.new(people)
@new_yorker = Magazine.new(new_yorker)
@forbes = Magazine.new(forbes)

@time.save
@people.save
@new_yorker.save
@forbes.save

# ARTICLES
time_article = { title: "Judge Orders 50 Cent to Explain Instagram Photos", body: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", magazine_id: 1, journalist_id: 1 }

people_article = { title: "Every Child Should Grow Up in a Home", body: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", magazine_id: 2, journalist_id: 2 }

new_yorker_article = { title: "Harper Lee: A Reading List", body: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", magazine_id: nil, journalist_id: 3 }

forbes_article = { title: "Watch Out For These Top Tax Scams", body: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", magazine_id: nil, journalist_id: 4 }

@time_article = Article.new(time_article)
@people_article = Article.new(people_article)
@new_yorker_article = Article.new(new_yorker_article)
@forbes_article = Article.new(forbes_article)

@time_article.save
@people_article.save
@new_yorker_article.save
@forbes_article.save
