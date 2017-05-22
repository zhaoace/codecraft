import string
str1 = 'abcdea'
str2 = string.capitalize(str1)
str3 = string.center(str1,19)
str4 = string.count(str1,'a')
#str5  = string.decode(encoding='UTF-8',errors='strict')
str6 = str1.endswith('a')
str7 = str1.find('a')
str8 = str1.upper()
str9 = str8.lower()
str10 = '   abcdef   '
str11 = str10.lstrip()+'111'
str12 = str10.rstrip()+'111'
str1x = str10.strip()+'111'
str13 = 'Come on, baby, your kiss is like a thunder, p de wo wai jiao li neng...'
str14 = str13.title()
str15 = str14.swapcase()
str16 = ':'.join(str13.split())
str17 = str13.replace('is','go')
print str2
print str3
print str4
print str6
print str7
print str8
print str9
print str11
print str12
print str1x
print str14
print str15
print str16

