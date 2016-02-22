# JOURNALISTS
sagar = { name: "Sagar" }
saied = { name: "Saied" }
sammy = { name: "Sammy" }
greta = { name: "Greta" }
yonce = { name: "yonce" }
ronny = { name: "Ronny" }


@sagar = Journalist.new(sagar)
@saied = Journalist.new(saied)
@sammy = Journalist.new(sammy)
@greta = Journalist.new(greta)
@yonce = Journalist.new(yonce)
@ronny = Journalist.new(ronny)

@sagar.save
@saied.save
@sammy.save
@greta.save
@yonce.save
@ronny.save

# MAGAZINES
time = { name: "Time Magazine" }
people = { name: "People Magazine" }
new_yorker = { name: "The New Yorker" }
forbes = { name: "Forbes" }
business_week = { name: "Business Week" }

@time = Magazine.new(time)
@people = Magazine.new(people)
@new_yorker = Magazine.new(new_yorker)
@forbes = Magazine.new(forbes)
@business_week = Magazine.new(business_week)

@time.save
@people.save
@new_yorker.save
@forbes.save
@business_week.save

# ARTICLES
time_article = { title: "Judge Orders 50 Cent to Explain Instagram Photos", body: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", magazine_id: 1, journalist_id: 1 }

people_article = { title: "Every Child Should Grow Up in a Home", body: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", magazine_id: 2, journalist_id: 2 }

new_yorker_article = { title: "Harper Lee: A Reading List", body: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", magazine_id: 3, journalist_id: 3 }

forbes_article = { title: "Watch Out For These Top Tax Scams", body: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", magazine_id: 3, journalist_id: 3 }

business_week_article = { title: "Stock Market Crashes", body: "Today the stock market crashed and it.was.bad.  No one is happy and everyone lost a lot of money. Oh boy." , magazine_id: 5, journalist_id: 5 }

time_article_two = { title: "Trump wins South Carolina", body: "NOooooooooooo ohhhh lord no bueno que paso", magazine_id: 1, journalist_id: 5 }

new_yorker_article_two = { title: "Walking Dead Season Recapt", body: "Everyone died this season cuz of the zombie chompings.", magazine_id: 3, journalist_id: 6 }

people_article_two = { title: "The Celebrities are Quitting the Biz", body: "They're all done with it.  No more movies or songs from famous singers and actors. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", magazine_id: 2, journalist_id: 2 }

forbes_article_two = { title: "Bu$ni$ Time all the Time.", body: "Today we are learning how to program at school. Help us. Lorem incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", magazine_id: 4, journalist_id: 4 }

@time_article = Article.new(time_article)
@people_article = Article.new(people_article)
@new_yorker_article = Article.new(new_yorker_article)
@forbes_article = Article.new(forbes_article)
@business_week_article = Article.new(business_week_article)
@time_article_two = Article.new(time_article_two)
@new_yorker_article_two= Article.new(new_yorker_article_two)
@people_article_two= Article.new(people_article_two)
@forbes_article_two= Article.new(forbes_article_two)

@time_article.save
@people_article.save
@new_yorker_article.save
@forbes_article.save
@time_article_two.save
@new_yorker_article_two.save
@people_article_two.save
@business_week_article.save
@forbes_article_two.save
