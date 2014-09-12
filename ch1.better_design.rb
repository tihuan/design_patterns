# Better Programs with Design Patterns
# Four Rules:
# 1. Separate out the things that are likely to change from the rest
# 2. Program to interface, not implementation
# 3. Prefer composition over inheritance
# 4. Delegate, delegate, delegate!

# Bad
my_car = Car.new
my_car.drive(200)
if is_car
  my_car = Car.new
  my_car.drive(200)
else
  my_plane = AirPlane.new
  my_plane.fly(200)
end

# Good
my_vehicle = get_vehicle
my_vehicle.travel(200)

# Another example using car
class Engine
  # All sorts of engin-related code...

  def start
    # Start the engine
  end

  def stop
    # Stop the engine
  end
end

class Car
  def initialize
    @engine = Engine.new
  end

  def sunday_drive
    @engine.start
    # Cruise out into the country and return...
    @engine.stop
  end
end
