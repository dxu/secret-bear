mongoose = require 'mongoose'
crypto = require 'crypto'

User = new mongoose.Schema username: String, h_password: String, salt: String

User.methods.encryptPassword = (password) ->
  return crypto.createHmac 'sha1', this.salt 
    .update password
    .digest 'hex'

User.methods.authenticate = (plain_pass) ->
  return @.encryptPassword plain_pass == this.hashed_password

User.methods.makeSalt = ->
  return Math.round (new Date().valueOf() * Math.random + '')

User.virtual('password')
  .get( -> @.h_password )
  .set( (password) -> 
    @.salt = @.makeSalt
    @.hashed_password = @.encryptPassword password
    console.log "INSIDE BRO \n\n\n\n\n\n"
  )

 

module.exports = mongoose.model 'User', User
