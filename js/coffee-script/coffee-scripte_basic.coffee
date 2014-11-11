# Assignment:
number   = 42
opposite = true

# Conditions:
number = -42 if opposite

# Functions:
square = (x) -> x * x

# Arrays:
list = [1, 2, 3, 4, 5]

# Objects:
math =
  root:   Math.sqrt
  square: square
  cube:   (x) -> x * square x

# Splats:
race = (winner, runners...) ->
  print winner, runners

# Existence:
console.log "I knew it!" if xxx?
xxx = "something"
console.log "I knew it!" if xxx?

# Array comprehensions:
cubes = (math.cube num for num in list)
cubes = (num for num in list)
cubes = (num+1 for num in list)
cubes = (consoel.log num+1 for num in list)


# Array Slicing and Splicing with Ranges
numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9]

start   = numbers[0..2]

middle  = numbers[3...-2]  # Attension , here are .*3 in the []

end     = numbers[-2..]

copy    = numbers[..]

# update set of the array
numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
numbers[3..6] = [-3, -4, -5, -6]
numbers



# Ternary operator
name = if 24 > 21 then "Liz" else "Ike"  # The same as  name = (24>21)? "Liz": "Ike"


# switch
grade = switch
  when score < 60 then 'F'
  when score < 70 then 'D'
  when score < 80 then 'C'
  when score < 90 then 'B'
  else 'A'


# try catch finally
try
  allHellBreaksLoose()
  catsAndDogsLivingTogether()
catch error
  print error
finally
  cleanUp()

#String Interpolation, Block Strings, and Block Comments
author = "Wittgenstein"
quote  = "A picture is a fact. -- #{ author }"

sentence = "#{ 22 / 7 } is a decent approximation of π"