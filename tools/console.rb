require 'pry' # Pry.start does not work without requring pry
require_relative '../config/environment'
require_relative '../tools/seed'

def reload!
  load('../config/environment.rb')
end

action = "something"

while action != "Exit"
  puts "Welcome. Would you like to browse, write, or publish an article? (Browse, Write, Publish, Exit)"
  action = gets.chomp

  case action

  when "Browse"
    controller = MagazinesController.new
    controller.index
    controller = MagazinesController.new
    article_title = controller.show
    article = Article.all.find {|article| article.title == article_title}
    puts article.body if article

  when "Write"
    controller = JournalistsController.new
    journalist_argument = controller.new
    controller = JournalistsController.new
    controller.create_article(journalist_argument)

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
