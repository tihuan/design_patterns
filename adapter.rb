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
# a ^ b = 0011 0001
