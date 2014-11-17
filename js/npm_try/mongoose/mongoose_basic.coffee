
{exec} = require 'child_process'
p = (x) -> console.log x




mongoose = require 'mongoose'

mongoose.connect 'mongodb://localhost/test'

db = mongoose.connection

db.on "error", console.error.bind console, 'connection error:'




kittySchema = mongoose.Schema {name: String }

Kitten = mongoose.model 'Kitten', kittySchema


silence = new Kitten({ name: 'Name_Silence' })


p silence.name



