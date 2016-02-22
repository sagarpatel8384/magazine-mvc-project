require_relative '../config/environment.rb'
require_relative 'seed'

def reload!
  load('../config/environment.rb')
end

puts <<-NEWS

`:///:.`       .yyyyyyy. `+syyyyyyyyyyyyyyyyys              -yyyys:      `./+ooo+:`
`oyyyyyyy+     `oyyyyyy: `syyyyyyyyyyyyyyyyyyy/   `---.     `syyyyy:   `-+syyyyyyyyy/`
+yyyyyyyy+     /yyyyyyo``oyyyyys/:-.```oyyyyyo`  .oyyyy:   `oyyyyy/  .+syyyyyyyyyyyyyo
/yyyyyyyyy/    -yyyyyyy` +yyyyyy-      :yyyyyy.  `syyyyy`  `+yyyyy/ `+yyyyyyys/.syyyyyy`
-yyyyyyyyyy:   `syyyyyy: :yyyyyy:      `syyyyy:  .syyyyy+  `+yyyyy+`:syyyyyyo-``/yyyyyy:
`syyyyyyyyyy:   +yyyyyy+ -yyyyyy/       :yyyyys` `syyyyyy/  +yyyyys.+yyyyyys-`.:oyyyyys-
oyyyyyyyyyyy-  .yyyyyys`.yyyyyyo.`.---` oyyyyy/ `oyyyyyyy. +yyyyyy-oyyyyyy+` ./+ossso:`
/yyyyyyyyyyyy-  oyyyyyy-`syyyyyyyssyyyy-.yyyyyy``oyyyyyyys :yyyyyy-/yyyyyy+`     ````
.yyyyyyyyyyyyy. :yyyyyy+ +yyyyyyyyyyyyyy.+yyyyyo`+yyyyyyyy/-yyyyyy:`yyyyyyy-.----.`
oyyyyyyyyyyyyy``syyyyys`-yyyyyyyyysooo+:`syyyyy//yyyyyyyyy:syyyyy: `syyyyyyyyyyyyys+-
:yyyyyyy+yyyyyy.+yyyyyy-`yyyyyyo...``    .yyyyyysyyyyyyyyyyyyyyyy/   `/syyyyyyyyyyyyyy:
.syyyyyy+-yyyyyy/yyyyyyo`+yyyyyy.         /yyyyyyyyyyyyyyyyyyyyyy/ `.--..-/+o+::oyyyyyy+
+yyyyyys`-yyyyyyyyyyyyy.:yyyyyy/          oyyyyyyyyyyoyyyyyyyyyy+.+syyyys+`     /yyyyyy-
-yyyyyyy: -yyyyyyyyyyyy:`syyyyys`         `syyyyyyyyy-syyyyyyyyy+-syyyyyys:     -yyyyyy+
`syyyyyyo  .yyyyyyyyyyyo`/yyyyyy: ``..-:/+o+yyyyyyyyy-`yyyyyyyyy+.syyyyyy/`    `/yyyyyyo`
:yyyyyyy.  `yyyyyyyyyyy..yyyyyyyoossyyyyyyyyyyyyyyyy- :yyyyyyyy+`.yyyyyyo    `:syyyyyy/
`syyyyyy/   `syyyyyyyyy: oyyyyyyyyyyyyyyyyyyyyyyyyyy:  +yyyyyyy+`  :syyyyy+//oyyyyyyy+.
-yyyyyys`    oyyyyyyyy+ .yyyyyyyyyyyyyso+/-.-yyyyyy/   oyyyyyy/     `-+syyyyyyyyyys/.
oyyyyyy-     +yyyyyyyo  -syyyyso//:..`      `:osyy+    ./+oss:          `-:/++++:.
`yyyyyyo      /yyyyyy+`   `.:-`                 ```
-yyyyyy-       `.:/+-

NEWS

sleep(1)
action = "Read"
while action != "Exit"
  puts "Would you like to browse, write, or publish an article? (Enter 'Browse', 'Write', 'Publish', or 'Exit')"
  action = gets.chomp

  case action
  when "Browse"
    controller = ArticlesController.new
    browse_action = controller.new

      case browse_action
      when "Main Menu"
        redo
      when "Magazine"
        # Opens Browse Window with list of Magazines
        controller = MagazinesController.new
        controller.index
        # Asks which Magazine to View
        controller = MagazinesController.new
        article_title = controller.show
        controller = ArticlesController.new
        controller.show(article_title)

      when "Journalist"
        controller = JournalistsController.new
        controller.index
        # Asks which Magazine to View
        controller = JournalistsController.new
        article = controller.show
        controller = ArticlesController.new
        controller.show(article)
      end

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

