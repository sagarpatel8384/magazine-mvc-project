module Validateable
  def valid_argument(all, attribute, column)
    begin
      print "Please enter a valid #{attribute}: "
      result = gets.chomp
    end while !all.find { |element| element.send("#{column}") == result }
    result
  end
end
