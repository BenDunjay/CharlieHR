require_relative "./lib/User"

tests = [
  Date.new(1986, 1, 1),
  Date.new(1988, Date.today.month, Date.today.day),
  Date.new(1972, 12, 30),
  Date.new(1960, 8, 05),
  Date.new(1990, 6, 04),
  Date.new(1990, 11, 06),
  Date.new(2021, 1, 1),
  Date.new(2012, 10, 30),
  Date.new(2020, 11, 06),
]
puts " ====== Ages ====== "

tests.each do |date|
  puts "#{date} => #{User.new(" Test ", date).age}"
end

puts " ====== Days until next birthday ====== "
tests.each do |date|
  puts "#{date} => #{User.new(" Test ", date).days_until_birthday}"
end

puts " ====== Birthdays ====== "

tests.each do |date|
  puts "#{date} => #{User.new(" Test ", date).next_birthday}"
end
