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
