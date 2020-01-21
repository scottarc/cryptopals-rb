require "base64"

# decode from hex
decoded = ["49276d206b696c6c696e6720796f757220627261696e206c696b65206120706f69736f6e6f7573206d757368726f6f6d"].pack('H*')
# encode to base64
puts Base64.strict_encode64(decoded)
