class MagazinesNewView

  def select_magazine
    puts "Which magazine would you like to browse? (Enter Name)"
    all = Magazine.all
    valid_argument(all, "magazine", "name")
  end

  def valid_argument(all, attribute, column)
    begin
      print "Please enter a valid #{attribute}: "
      result = gets.chomp
    end while !all.find { |element| element.send("#{column}") == result }
    result
  end

end
