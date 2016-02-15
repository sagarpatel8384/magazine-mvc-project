require 'pry' # Pry.start does not work without requring pry
require_relative '../config/environment'
# require_relative '../tools/seed' # Not Working

# def reload!
#   load('../config/environment.rb')
# end

["Time", "People", "New Yorker", "Nylon", "Wired"].each do |magazine|
  Magazine.new(magazine)
end

greta = Journalist.new("Greta")
sammy = Journalist.new("Sammy")

greta.write_article_by_title("Ruby on Rails Tutorial")
greta.write_article_by_title("Python Tutorial")

greta.submit_article("Ruby on Rails Tutorial", "Time")
greta.submit_article("Ruby on Rails Tutorial", "People")

sammy.write_article_by_title("HTML Tutorial")
sammy.write_article_by_title("CSS Tutorial")

sammy.submit_article("HTML Tutorial", "Wired")
sammy.submit_article("CSS Tutorial", "Nylon")


Pry.start
