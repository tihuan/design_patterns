class ArrayIterator

  def initialize(array)
    @array = array # Prefer @array = Array.new(array) for CHANGE RESIStENCE
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

array = %w(a b c d e)
iterator = ArrayIterator.new(array)
# p iterator.item
# p iterator.next_item
# p iterator.next_item
# p iterator.item
# p iterator.item
while iterator.has_next? #=> a, b, c, d, e
  p iterator.next_item
end
