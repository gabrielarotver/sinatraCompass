# problem 1
directions = ["north", "east", "south", "west"]
puts "problem 1 output: directions[3] => #{directions[3]}"

# problem 2
compass = {n: "#{directions[0]}", e: "#{directions[1]}", s: "#{directions[2]}", w: "#{directions[3]}"}
puts "problem 2 output: compass[:n] => #{compass[:n]}"

# problem 3a
class Direction
  attr_reader :abbreviation, :direction_name

  def initialize(abr, dir)
    @abbreviation = abr
    @direction_name = dir
  end
end

d = Direction.new("n", "North")
puts "problem 3a output: d.direction_name => #{d.direction_name}"

# problem 3b
class Compass
  attr_reader :directions
  def initialize
    @directions = [Direction.new("n", "North"),
                  Direction.new("e", "East"),
                  Direction.new("s", "South"),
                  Direction.new("w", "West")]
  end
end

my_compass = Compass.new
puts "problem 3b output1: my_compass.directions[0].abbreviation => #{my_compass.directions[0].abbreviation}"

puts "problem 3b output2: my_compass.directions[0].direction_name => #{my_compass.directions[0].direction_name}"


# problem 4
# require 'sinatra'
#
# get '/' do
#   "test"
# end

# problem 5
require 'sinatra'


get '/' do
  abbreviation = params['direction']
  my_compass = Compass.new
  position = nil;

  my_compass.directions.each_with_index do |dir, index|
    if(dir.abbreviation == abbreviation)
      position = index
      break
    end
  end

  if (!position.nil?)
    "The direction corresponding to #{abbreviation} is #{my_compass.directions[position].direction_name}"
  else
    "Invalid Query!"
  end
end
