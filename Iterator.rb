# ArrayIterator
class ArrayIterator
  def initialize(array)
    @array = array
    @index = 0
  end

  def has_next?
    @index < @array.length
  end

  def item
    @array[@index]
  end

  def next_item
    value = @array[@index]
    @index += 1
    value
  end
end

# Internal Iterator
def for_each_element(array)
  i = 0
  while i < array.length
    yield(array[i])
    i += 1
  end
end

# Internal Iterator in action
a = [10, 20, 30]
for_each_element(a) { |element| puts "The element is #{element}" }
