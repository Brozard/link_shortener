def link_shortener(link_id)
  # Initialize string to use for Base 62 conversion
  convert_set = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
  # Initialize empty string to push converted IDs into
  short_url = ""
  until link_id == 0
    # Convert the remainder value to Base 62 and add it to the beginning of 'short_url'...
    short_url.prepend(convert_set[link_id % 62])
    # ...and then divide by 62, in turn dropping the remainder value.
    link_id /= 62
  end
  # Return the converted ID
  short_url
end

def id_look_up(short_url)
  # Initialize integer to store the ID
  id = 0
  # Store the ASCII decimal values of each character in 'short_url'
  short_url_ascii = short_url.bytes
  # Iterate through each character and increase the ID value accordingly
  short_url.length.times do |i|
    if short_url[i] >= "a" && short_url[i] <= "z"
      id = id * 62 + short_url_ascii[i] - 97
    elsif short_url[i] >= "A" && short_url[i] <= "Z"
      id = id * 62 + short_url_ascii[i] - 39
    else short_url[i] >= "0" && short_url[i] <= "9"
      id = id * 62 + short_url_ascii[i] + 4
    end
  end
  # Return the ID for the original URL
  id
end

# Uncomment to run tests

# id = 12345
# puts link_shortener(id) == "dnh"
# puts id_look_up(link_shortener(id)) == 12345
# puts "==============="
# id = 332211
# puts link_shortener(id) == "byAp"
# puts id_look_up(link_shortener(id)) == 332211
