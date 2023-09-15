def find_short(str)
  result = str.split.map(&:length).min
  return result
end

puts find_short("bitcoin take over the world maybe who knows perhaps")
puts find_short("turns out random test cases are easier than writing out basic ones")
puts find_short("ets talk about javascript the best language")
puts find_short("i want to travel the world writing code one day")
puts find_short("Lets all go on holiday somewhere very cold")
puts find_short("Let's travel abroad shall wet")