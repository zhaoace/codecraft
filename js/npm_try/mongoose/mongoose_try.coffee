{exec} = require 'child_process'
p = (x) -> console.log x


mongoose = require 'mongoose'
mongoose.connect 'mongodb://localhost/test'
db = mongoose.connection
db.on "error", console.error.bind console, 'connection error:'

kittySchema = mongoose.Schema {name: String }
kittySchema.methods.speak  = () ->
    greeting = if this.name  then "Meow name is " + this.name  else   "I don't have a name"
    p greeting

Kitten = mongoose.model 'Kitten', kittySchema

fluffy = new Kitten({ name: 'fluffy' });
# fluffy.speak()
x =  new Kitten null
# x.speak()


fluffy.save (err, fluffy) ->
    return p err if err?
    # fluffy.speak()




Kitten.find (err, kittens) ->
    return p err if err?
    # p kittens


# Kitten.find({ name: /^Fluff/ }, callback)
# Kitten.find { name: /^Fluff/ }, p "callback"



timelogSchema = mongoose.Schema { name: String , tag: String, start_time: Date, end_time: Date }
p "xxx"


Timelog = mongoose.model 'zhaoli', timelogSchema

timelog = new Timelog {name:"zhaoli"}
timelog.tag = "new time record"
timelog.start_time = new Date()
timelog.end_time = new Date()

p timelog

timelog.save (err) ->
    Timelog.find (err, timelogs) ->
        db.close()
        p timelogs
        p timelogs.lenth




# db.tianyc04.insert({mark:1, mark_time:new Date()})
