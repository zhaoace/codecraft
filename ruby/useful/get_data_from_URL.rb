# get_data_from_duowan.rb

require "open-uri"

url = "http://coc.duowan.com/1303/228414562399.html"
page = open(url)
text = page.read


p text
# p text.scan(//)

