# Adapter exmaple
class Encrypter
  def initialize(key)
    @key = key
  end

  def encrypt(reader, writer)
    key_index = 0
    while not reader.eof?
      clear_char = reader.getc
      # Use ^ bit operator (XOR*) to encrypt each char
      encrypted_char = clear_char ^ @key[key_index]
      writer.putc(encrypted_char)
      key_index = (key_index + 1) % @key.size
    end
  end
end

# ^ bit operator only copies the bit if it's set in one operand but not both.
# Example:
# a = 0011 1100
# b = 0000 1101

# Encrypt
# a ^ b = 0011 0001 = c

# Decrypt
# c ^ b = 0011 1100 = a

# In action
reader = File.open('message.txt')
writer = File.open('message.encrypted', 'w')
encrypter = Encrypter.new('my secret key')
encrypter.encrypt(reader, writer)

# Suppose that we want to support encrypting string..
# We need to design interface for string to act as a IO object
class StringIOAdapter
  def initialize(string)
    @string = string
    @position = 0
  end

  def getc
    if @position >= @string.length
      raise EOFError
    end
    ch = @string[@position]
    @position += 1
    return ch
  end

  def eof?
    return @position >= @string.length
  end
end

