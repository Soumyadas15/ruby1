def helper(message, key, mode)
  asciiStart = 32
  asciiEnd = 126
  range = asciiEnd - asciiStart + 1

  key = mode == :decrypt ? -key : key
  res = message.chars.map do |char|
    newPos = (((char.ord - asciiStart) + key) % range)
    newChar = (newPos + asciiStart).chr
    newChar
  end
  res.join
end

print "Enter the message: "
message = gets.chomp

print "Enter the key (an integer): "
key = gets.to_i

print "Choose mode (encrypt/decrypt): "
mode_input = gets.chomp.downcase.to_sym

unless [:encrypt, :decrypt].include?(mode_input)
  puts "Invalid mode. Please choose 'encrypt' or 'decrypt'."
  exit
end

result = helper(message, key, mode_input)

puts "#{mode_input.capitalize}ed message: #{result}"