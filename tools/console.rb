require_relative '../config/environment.rb'
require_relative 'seed'

def reload!
  load('../config/environment.rb')
end


action = "something"

while action != "Exit"
  puts "Welcome. Would you like to browse, write, or publish an article? (Browse, Write, Publish, Exit)"
  action = gets.chomp

  case action

  when "Browse"
    # Opens Browse Window with list of Magazines
    controller = MagazinesController.new
    controller.index
    # Asks which Magazine to View
    controller = MagazinesController.new
    article_title = controller.show
    controller = ArticlesController.new
    controller.show(article_title)

  when "Write"
    # Create Journalist in Database
    controller = JournalistsController.new
    journalist_argument = controller.new
    # Create Article and associate Journalist in Database
    controller = JournalistsController.new
    controller.create_article(journalist_argument)

  when "Publish"
    # Find Journalist in Database
    controller = JournalistsController.new
    journalist = controller.get_journalist
    # Find Article in Database
    controller = JournalistsController.new
    article = controller.get_article
    # Find Magazine in Database
    controller = JournalistsController.new
    magazine = controller.get_magazine
    # Associate Article to Magazine
    controller = JournalistsController.new
    controller.publish(journalist, article, magazine)
  end

end
