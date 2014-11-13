
{exec} = require 'child_process'
p = (x) -> console.log x
# p "play.coffee"



f = ()-> p "f called."

function1 =  (err, callback) ->
    p "function1 called."
    return callback err if err
    return callback null, "return02"

function2 =  (message, callback) ->
    p "function2 start: #{message}"
    return callback err if err
    return callback null

x = {}
x =  function1 "err" , f
p x