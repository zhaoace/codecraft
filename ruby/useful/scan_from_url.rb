require 'open-uri'



# url = 'http://baidu.com'
url = 'http://www.amazon.com/gp/product/0974514055'
page = open(url)
text = page.read
# p text


p resultArray = text.scan(/url.*/)
p resultArray.size


