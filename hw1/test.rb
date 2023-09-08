# reverse

def reverse_string(string)
    return string.reverse
end

puts reverse_string("кит - на море романтик")

# iterators

i = 7
while i <= 10 do
    puts i
    i += 1
end

(1..5).each do |n|
    puts n
end

(1..5).each {|n| puts n}

(1..5).each(&method(:puts))

a = [1, 3, 4, 67, -3]
max = a[0]
i = 1
while i < a.size
    if a[i] > max
        max = a[i]
    end
    i = i + 1
end
puts max

p [1, 3, 4, 67, -3].max
