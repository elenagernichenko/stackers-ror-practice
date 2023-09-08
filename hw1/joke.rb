require 'httparty'
require 'nokogiri'

 # спрашивает у пользователя, если он прогер, то выводит согласно рандомному числу анекдот из категории "программист"
url = 'https://www.anekdot.ru/tags/%D0%BF%D1%80%D0%BE%D0%B3%D1%80%D0%B0%D0%BC%D0%BC%D0%B8%D1%81%D1%82'
response = HTTParty.get(url)

if response.code != 200
    puts 'не удалось получить данные с веб-сайта'
  else
    doc = Nokogiri::HTML(response.body)
        
    puts 'вы программитс? (Д/н)'
    # chomp удаляет символ перевода строки (\n)
    # downcase преобразование в нижний регист
    user_input = gets.chomp.downcase

    if user_input == 'д'
        puts 'введите случайное число'
        random_number = gets.to_i
        
        # проверка random_number находится в пределах диапазона индексов элементов коллекции анекдотов
        if random_number >= 0 && random_number < doc.css('.text').size
            puts doc.css('.text')[random_number].text
        else
            'диапазон доступных чисел от 0 до #{doc.css('.text').size - 1}'
        end
    else
        puts 'а пора бы'
    end
end