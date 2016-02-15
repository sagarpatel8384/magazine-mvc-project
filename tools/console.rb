require 'pry' # Pry.start does not work without requring pry
require_relative '../config/environment'
# require_relative '../tools/seed' # Not Working

# def reload!
#   load('../config/environment.rb')
# end

# SEED DATA

["Time", "People", "New Yorker", "Nylon", "Wired"].each do |magazine|
  Magazine.new(magazine)
end

# greta = Journalist.new("Greta")
# sammy = Journalist.new("Sammy")
#
# greta.write_article_by_title("Ruby on Rails Tutorial")
# greta.write_article_by_title("Python Tutorial")
#
# greta.submit_article("Ruby on Rails Tutorial", "Time")
# greta.submit_article("Ruby on Rails Tutorial", "People")
#
# sammy.write_article_by_title("HTML Tutorial")
# sammy.write_article_by_title("CSS Tutorial")
#
# sammy.submit_article("HTML Tutorial", "Time")
# sammy.submit_article("CSS Tutorial", "Time")


# CLI

action = "something"

while action != "Exit"
  puts "Welcome. Would you like to browse, write, or publish an article? (Browse, Write, Publish, Exit)"
  action = gets.chomp

  case action

  when "Browse"
    magazine = MagazinesController.new
    magazine.index
    magazine = MagazinesController.new
    magazine.show

  when "Write"
    journalist = JournalistsController.new
    journalist_argument = journalist.new
    journalist = JournalistsController.new
    journalist.create_article(journalist_argument)


  when "Publish"
    controller = JournalistsController.new
    journalist = controller.get_journalist
    controller = JournalistsController.new
    article = controller.get_article
    controller = JournalistsController.new
    magazine = controller.get_magazine
    controller = JournalistsController.new
    controller.publish(journalist, article, magazine)
  end

end

Pry.start
