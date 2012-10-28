User = require '../models/User'

#
# * GET users listing.
# 
exports.list = (req, res) ->
  res.send "respond with a resource"

exports.g_login = (req, res) ->
  res.render "login"

exports.g_signup = (req, res) ->
  res.render "signup"

exports.p_signup = (req, res) ->
  new_user = new User req.body.user

  new_user.save (err) ->
    if err
      console.log "ERROR CREATING USER"
      return
    else
      console.log "SAVING USER\n\nn\n\n\n\n\n"
      res.redirect "login"
