module Towable
  def can_tow?(pounds)
    pounds < 2000 ? true : false
  end
end

class Vehicle
  attr_accessor :color
  attr_reader :model, :year
  @@number_of_vehicles = 0

  def self.number_of_vehicles
    puts "This program has created #{@@number_of_vehicles} vehicles"
  end

  def initialize(year, model, color)
    @year = year
    @model = model
    @color = color
    @current_speed = 0
    @@number_of_vehicles += 1
  end

  def speed_up(number)
    @current_speed += number
    puts "You push the gas and accelerate #{number} mph."
  end

  def brake(number)
    @current_speed -= number
    puts "You push the brake and decelerate #{number} mph."
  end

  def current_speed
    puts "You are now going #{@current_speed} mph."
  end

  def shut_down
    @current_speed = 0
    puts "Let's park this bad boy!"
  end

  def self.gas_mileage(gallons, miles)
    puts "#{miles / gallons} miles per gallon of gas"
  end

  def spray_paint(color)
    self.color = color
    puts "Your new #{color} paint job looks great!"
  end
end

class MyTruck < Vehicle
  include Towable

  NUMBER_OF_DOORS = 2

  def to_s
    "My truck  is a #{self.color}, #{self.year}, #{self.model}!"
  end
end

class MyCar < Vehicle
  NUMBER_OF_DOORS = 4

  def to_s
    "My car is a #{self.color}, #{self.year}, #{self.model}!"
  end
end

class Drive
  test = []

  def initialize
    puts "What year?"
    @year = gets.chomp.to_s
    puts "What model?"
    @model = gets.chomp.to_s
    puts "What color?"
    @color = gets.chomp.to_s
    drive_time
  end

  def gas_mileage
    puts "How much gas do you want to fill?"
    @gallons = gets.chomp.to_s
    puts "How many miles are you going"
    @miles = gets.chomp.to_s
    puts "#{@miles}/#{@gallons} miles per gallon of gas"
  end
    
  def drive_time
    @go1 = MyCar.new(@year, @model, @color)
    loop do
      puts "You bought a #{@year} #{@model} in #{@color} from Jimmie's Auto. Drive'r home!"
      puts "Total is #{MyCar.number_of_vehicles}"
      puts "Gas (gas) or Go (go)?"
      action = gets.chomp.downcase
      if action == "gas"
        self.gas_mileage
      elsif action == "go"
        Drive.new
      end
    end
  end
end

drive = Drive.new