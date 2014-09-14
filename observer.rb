# Observer: Sub/Pub
class Employee
  attr_reader :name, :title
  attr_reader :salary

  def initialize(name, title, salary, payroll)
    @name = name
    @title = title
    @salary = salary
    @observers = []
    @payroll = payroll
  end

  def salary=(new_salary)
    @salary = new_salary
    notify_observers
  end

  def notify_observers
    @observers.each do |observer|
      observer.update(self)
    end
  end

  def add_observer(observer)
    @observers << observer
  end

  def delete_observer(observer)
    @observers.delete(observer)
  end
end

# Create an employee
fred = Employee.new('Fred', 'Crane Operator', 30000.0)
payroll = Payroll.new
fred.salary = 35000.0

# An observer
class TaxMan
  def update(changed_employee)
    puts "Send #{changed_employee.name} a new tax bill!"
  end
end

tax_man = TaxMan.new
fred.add_observer(tax_man)

# Extract observer code into a module
module Subject
  def initialize
    @observers = []
  end

  def add_observer(observer)
    @observers << observer
  end

  def delete_observer(observer)
    @observers.delete(observer)
  end

  def notify_observers
    @observers.each do |observer|
      observer.update(self)
    end
  end
end
