def maskify(str)
    if str.length > 4
        lasts = str[-4..-1]
        puts lasts
        
        sharped_part = "#" * (str.length - 4)
        result = sharped_part + lasts
    else
        result = str
    end
    return result
end

puts maskify("4556364607935616")
puts maskify("44607935616")
puts maskify("1")
puts maskify("")
puts maskify("Nananananananananananananananana Batman!")