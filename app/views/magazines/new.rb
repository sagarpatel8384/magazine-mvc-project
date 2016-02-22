class MagazinesNewView
  include Validateable

  def select_magazine
    puts "Which magazine would you like to browse? (Enter Name)"
    all = Magazine.all
    valid_argument(all, "magazine", "name")
  end
  
end
