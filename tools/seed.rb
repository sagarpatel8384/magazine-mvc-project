["Time", "People", "New Yorker", "Nylon", "Wired"].each do |mag|
  magazine = Magazine.new(name: mag)
  magazine.save
end
