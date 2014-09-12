class Task # Component class
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def get_time_required
    0.0
  end
end

class AddDryIngredientsTask < Task # Leaf

  def initialize
    super("Add dry ingredients")
  end

  def get_time_required
    1.0 # 1 minute to add flour and sugar
  end
end

class MixTask < Task # Leaf

  def initialize
    super("Mix that batter up!")
  end

  def get_time_required
    3.0 # Mix for 3 mintes
  end
end

# class Old_MakeBatterTask < Task # Composite

#   def initialize
#     super("Make batter")
#     @sub_tasks = []
#     add_sub_task(AddDryIngredientsTask.new)
#     add_sub_task(MixTask.new)
#   end

#   def add_sub_task(task)
#     @sub_tasks << task
#   end

#   def remove_sub_task(task)
#     @sub_tasks.delete(task)
#   end

#   def get_time_required
#     time = 0.0
#     @sub_tasks.each { |task| time += task.get_time_required }
#     time
#   end
# end

class CompositeTask < Task # Real Composite

  def initialize(name)
    super(name)
    @sub_tasks =[]
  end

  def add_sub_task(task)
    @sub_tasks << task
  end

  def remove_sub_task(task)
    @sub_tasks.delete(task)
  end

  def get_time_required
    time = 0.0
    @sub_tasks.each { |task| time += task.get_time_required }
    time
  end
end

class MakeBatterTask < CompositeTask # A type of Composite

  def initialize
    super("Make batter")
    add_sub_task(AddDryIngredientsTask.new)
    add_sub_task(MixTask.new)
  end
end

class MakeCakeTask < CompositeTask # A type of Composite. Complex one.

  def initialize
    super("Make cake")
    add_sub_task(MakeBatterTask.new)
    add_sub_task(FillPanTask.new)
    add_sub_task(BakeTask.new)
    add_sub_task(FrostTask.new)
    add_sub_task(LickSpoonTask.new)
  end
end



