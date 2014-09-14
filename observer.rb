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
end
