def count_words(arr)
  word_count = Hash.new(0)

  arr.each do |word|
    word_count[word] += 1
  end

  result = []

  word_count.each do |word, count|
    plural_word = "#{word}ов" if count != 1
    result << "#{count} #{plural_word || word}" #если plural_word имеет значение, то будет использовано plural_word. если plural_word равно nil или false, то будет использовано word.
  end

  result_string = result.join(", ")
end

input_list = ["Стол", "Сапог", "Стол", "Ручка", "Сапог", "Сапог", "Сапог", "Сапог"]
result = count_words(input_list)
p result