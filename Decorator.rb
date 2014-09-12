class SimpleWriter
  def initialize(path)
    @file = File.open(path, "w")
  end

  def write_line(line)
    @file.print(line)
    @file.print("\n")
  end

  def pos
    @file.pos
  end

  def rewind
    @file.rewind
  end

  def close
    @file.close
  end
end

class WriterDecorator # Decorator superclass CHECK better solution below
  def initialize(real_writer)
    @real_writer = real_writer
  end

  def pos
    @real_writer.pos
  end

  def rewind
    @real_writer.rewind
  end

  def close
    @real_writer.close
  end
end

##########  REWRITE WriterDecorator using Forwardable ##########
##########  1000 X BETTER SOLUTION. BUY NOW ##########

require "forwardable"
class WriterDecorator
  extend Forwardable
  def_delegators :@real_writer, :write_line, :rewind, :pos, :close

  def initialize(real_writer)
    @real_writer = real_writer
  end
end

class NumberingWriter < WriterDecorator
  def initialize(real_writer)
    super(real_writer)
    @line_number = 1
  end

  def write_line(line)
    @real_writer.write_line("#{@line_number}: #{line}")
    @line_number += 1
  end
end

########## BETTER EXAMPLE OF DELEGATOR ##########

# class Robot
#   def initialize
#     @heat_sensor = HeatSensor.new
#     @arm = RobotArm.new
#   end

#   def measure_heat(scale="c")
#     @heat_sensor.measure(scale)
#   end

#   def stack(boxes_number=1)
#     @arm.stack(boxes_number)
#   end

#   def package
#     @arm.package
#   end
# end

class HeatSensor
  # Celsius or Fahrenheit scale

  def measure(scale="c")
    t = rand(100)
    t = scale =="c" ? t : t * (9/5)
    puts "Heat is #{t} #{scale.upcase}"
  end
end

class RobotArm
  def stack(boxes_number=1)
    puts "Stacking #{boxes_number} box(es)"
  end

  def package
    puts "Packaging"
  end
end

########## REFACTOR class Robot USING DELEGATOR ##########

require "forwardable"
class Robot
  extend Forwardable
  # delegator: variable, method, alias
  def_delegator :@heat_sensor, :measure, :measure_heat
  # delegators: variable, method, method, etc.
  def_delegators :@arm, :stack, :package
  def initialize
    @heat_sensor = HeatSensor.new
    @arm = RobotArm.new
  end
end

robo = Robot.new #=>#<Robot:0xb75131e8 @arm=#<RobotArm:0xb75131ac>, @heat_sensor=#<HeatSensor:0xb75131c0>>
robo.stack 2 #=>Stacking 2 box(es)
robo.package #=>Packaging
robo.measure_heat #=> Heat is 59° C

########## My Example ##########

require "forwardable"
class Direction
  extend Forwardable
  def_delegators :@left, :go_left
  def_delegators :@right, :go_right
  def initialize
    @left = Left.new
    @right = Right.new
  end
end

class Right
  def go_right
    puts "Go right"
  end
end

class Left
  def go_left
    puts "Go left"
  end
end

direction = Direction.new
direction.go_left
direction.go_right
