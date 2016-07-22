def link_shortener(link_id)
  convert_set = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
  short_url = ""
  until link_id == 0
    short_url.prepend(convert_set[link_id % 62])
    link_id /= 62
  end
  short_url
end

id = 12345
puts link_shortener(id)