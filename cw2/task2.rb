def duplicate(str)
    str = str.downcase
    result = ""

        str.each_char do |char|
        if str.count(char) > 1
            result << ")"
        else
            result << "("
        end
    end
    return result
end

puts duplicate("din")
puts duplicate("recede")
puts duplicate("Success")
puts duplicate("(( @")
