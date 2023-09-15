class Raspberry
  @@states = ["Отсутствует", "Цветение", "Зеленая", "Красная"]
  
  protected
  def initialize(index)
    @index = index
    @state = @@states[0]
  end

  public
  def grow!
    current_index = @@states.index(@state)
    @state = @@states[current_index + 1] unless ripe?
  end

  def ripe?
     @state == @@states.last
  end
end

class RaspberryBush
  def initialize(digit_raspberries)
    @raspberries = Array.new(digit_raspberries) {Raspberry.new(rand(1...20))}
  end

  def grow_all!
    @raspberries.each do |raspberry|
      raspberry.grow!
    end
  end

  def ripe_all?
    @raspberries.all? { |raspberry| raspberry.ripe? }
  end

  def give_away_all!
    @raspberries.clear
  end
end

class Human
  

  def initialize(name, plant)
    @name = name
    @plant = plant
  end

  def work!
    @plant.grow_all!
  end

  def harvest
    if @plant.ripe_all?
      p "сбор урожая"
      @plant.give_away_all!
    else
      p "рано для сбора урожая"
    end
  end

  protected

  attr_reader :plant

  def self.knowledge_base #статический метод, принадлежит самому классу и вызывается без создания экземпляра класса
    p "Почему малину лучше сажать весной? Потому что, если вы посадите ее осенью, она может подумать, что это уже зима, и решит провести всю зиму под одеялом"
  end
end

def available_commands
  p "welcome to this game, #{@user_name}!"
  p "commands:"
  p "work - ухаживать за малиновым кустом"
  p "harvest - собрать урожай"
  p "exit - выход из игры"
end

if __FILE__ == $PROGRAM_NAME
  p "===================="
  Human.knowledge_base

  raspberry_bush = RaspberryBush.new(7)

  chel = Human.new("Stepa", raspberry_bush)

  7.times do
    chel.work!
    chel.harvest
  end

  p "=====lets game======"
  p "enter you name"
  @user_name = gets.chomp

  puts "enter the num of ruspberry bushes that you want to grow"
  num_bushes = gets.chomp.to_i

  raspberry_bushes = RaspberryBush.new(num_bushes)
  user = Human.new(@user_name, raspberry_bushes)
  
  available_commands

  loop do
    print "enter the command: "
    command = gets.chomp.downcase

    case command
    when "work"
      user.work!
      p "you are caring your bushes"
    when "harvest"
      user.harvest
    when "exit"
      p "bye!"
    else
      p "I don't know such command. try again"
    end
  end
end