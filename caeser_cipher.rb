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
  jump_number = number + key
  if jump_number > 90 && jump_number < 97
    jump_number = jump_number - 26
    array.push(jump_number)
  elsif jump_number > 122 && jump_number > 97
    jump_number = jump_number - 26
    array.push(jump_number)
  else 
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

cipher("hoUSe pARty", 7)
