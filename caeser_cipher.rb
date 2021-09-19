def cipher(string, key)
  x = 0
  numbers = string.codepoints
  secret_message = []
  puts numbers
  while x < numbers.length do
    if numbers[x] == 32 
      secret_message.push(numbers[x])
      x += 1
    else
    wrap(numbers[x], key, secret_message)
    x += 1
    end
  end
  secret_message = decode(secret_message)
  message = secret_message.join
  puts message
end

#Wrapping ASCII numbers
def wrap (number, key, array)
  if number > 90 && number < 97
    jump_number = number - 26
    puts jump_number
    puts "got it"
    array.push(jump_number)
  elsif number > 122 
    jump_number = number - 26
    puts jump_number
    array.push(jump_number)
  else 
    jump_number = number + key
    puts jump_number
    puts "else statement"
    array.push(jump_number)
  end
  array
end


#Change Integers back to ASCII
def decode(array)
  x = 0
  secret = []
  while x < array.length do
    secret.push(array[x].chr)
    x += 1
  end
  secret
end

cipher("zZ", 3)
