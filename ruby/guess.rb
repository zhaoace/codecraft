# 把程式儲存為 guess.rb
words = ['foobar', 'baz', 'quux']
secret = words[rand(3)]

print "guess?"
while guess = STDIN.gets
  guess.chop!
  if guess == secret
    puts "You win!"
    break
  else
    ptus "Sorry, you lose."
  end
  print "guess?"
end
puts "The word was " + secret + "."