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

# Begin Challenge 3

def score_plaintext(str)
  chars = str.split('')
  score = 0
  chars.each { |c|
    if ['e', 'E'].include? c
      score += 26
    elsif ['a', 'A'].include? c
      score += 25
    elsif ['i', 'I'].include? c
      score += 24
    elsif ['r', 'R'].include? c
      score += 23
    elsif ['t', 'T'].include? c
      score += 22
    elsif ['o', 'O'].include? c
      score += 21
    elsif ['n', 'N'].include? c
      score += 20
    elsif ['s', 'S'].include? c
      score += 19
    elsif ['l', 'L'].include? c
      score += 18
    elsif ['c', 'C'].include? c
      score += 17
    elsif ['u', 'U'].include? c
      score += 16
    elsif ['p', 'P'].include? c
      score += 15
    elsif ['m', 'M'].include? c
      score += 14
    elsif ['d', 'D'].include? c
      score += 13
    elsif ['h', 'H'].include? c
      score += 12
    elsif ['g', 'G'].include? c
      score += 11
    elsif ['b', 'B'].include? c
      score += 10
    elsif ['y', 'Y'].include? c
      score += 9
    elsif ['f', 'F'].include? c
      score += 8
    elsif ['v', 'V'].include? c
      score += 7
    elsif ['w', 'W'].include? c
      score += 6
    elsif ['k', 'K'].include? c
      score += 5
    elsif ['x', 'X'].include? c
      score += 4
    elsif ['z', 'Z'].include? c
      score += 3
    elsif ['q', 'Q'].include? c
      score += 2
    elsif ['j', 'J'].include? c
      score += 1
    end
  }
  score
end

def guess_plaintext(target)
  max_score = 0
  max_plain = ''
  (0..255).each { |i|
    tmp = Array.new(target.length, i).pack('C*')
    xored = xor_strings(target, tmp)
    score = score_plaintext(xored)
    if score > max_score
      max_score = score
      max_plain = xored
    end
  }
  max_plain
end
puts guess_plaintext(hex2bin("1b37373331363f78151b7f2b783431333d78397828372d363c78373e783a393b3736"))
