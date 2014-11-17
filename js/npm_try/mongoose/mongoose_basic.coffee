p = (x) -> console.log x


mongoose = require 'mongoose'

mongoose.connect 'mongodb://localhost/test'
db = mongoose.connection
db.on "error", console.error.bind console, 'connection error:'

userSchema = mongoose.Schema {name:String , age:Number }
UserModel = mongoose.model 'User', userSchema
user1 = new UserModel({ name: 'Zhao, Li', age:28 })
user2 = new UserModel({ name: 'Zhou, Tony', age:24 })



UserModel.find (err, x_find) ->
    p "x_find = #{x_find}"
    user1.save (x0) ->
        p "x0 = #{x0}"

user2.save (x1) ->
    p "x1 = #{x1}"
    UserModel.find (err, x2_find) ->
        p "x2_find = #{x2_find}"
        db.close()
        p "db.closed."



