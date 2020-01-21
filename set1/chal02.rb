# Challenge 2
def hex2bin(stringData)
  [stringData].pack('H*')
end

def bin2hex(rawBinary)
  rawBinary.unpack('H*')
end

def xor_strings(message = '', key = '')
  ArgumentError.new("Message cannot be nil") if message.nil?
  ArgumentError.new("Key cannot be nil") if key.nil?
  raise ArgumentError.new("Message length cannot be zero") unless message.length > 0
  raise ArgumentError.new("Key length cannot be zero") unless key.length > 0
  msgbytes = message.bytes
  keybytes = key.bytes
  outputbytes = []
  i = 0
  while i < msgbytes.length
    k = i % keybytes.length
    outputbytes.append(msgbytes[i] ^ keybytes[k])
    i += 1
  end
  outputbytes.pack('c*')
end

a = hex2bin("1c0111001f010100061a024b53535009181c")
b = hex2bin("686974207468652062756c6c277320657965")
c = xor_strings(a, b)
puts bin2hex(c)
