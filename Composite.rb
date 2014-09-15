# Component class
class Task
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def get_time_required
    0.0
  end
end

# two leaf classes
class AddDryIngredientsTask < Task
  def initialize
    super('Add dry ingredients')
  end

  def get_time_required
    1.0 # 1 minute to add flour and sugar
  end
end

class MixTask < Task
  def initialize
    super('Mix that batter up!')
  end

  def get_time_required
    3.0 # Mix for 3 minutes
  end
end
