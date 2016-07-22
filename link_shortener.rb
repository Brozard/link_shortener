def link_shortener(link_id)
  convert_set = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
  short_url = ""
  until link_id == 0
    short_url.prepend(convert_set[link_id % 62])
    link_id /= 62
  end
  short_url
end

def id_look_up(short_url)
  id = 0
  short_url_ascii = short_url.bytes
  short_url.length.times do |i|
    if short_url[i] >= "a" && short_url[i] <= "z"
      id = id * 62 + short_url_ascii[i] - 97
    elsif short_url[i] >= "A" && short_url[i] <= "Z"
      id = id * 62 + short_url_ascii[i] - 39
    else short_url[i] >= "0" && short_url[i] <= "9"
      id = id * 62 + short_url_ascii[i] + 4
    end
  end
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
