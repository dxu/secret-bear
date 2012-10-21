Room = require '../models/Room'
#
# * GET users listing.
# 
exports.view = (req, res) ->
  view_room = Room.findOne { name: req.params.name }
  view_room.exec (err, room) ->
    if err or room == null
      console.log 'error viewing room'
      return
    else 
      console.log 'hi\n\n\n\n\n'
      console.log room
#      console.log room.name
      res.render "room", name: room.name

exports.new = (req, res) ->
  # new_room = new Room req.body.room
  new_room = new Room req.body.room  
  console.log req.body.room
  console.log "HERE \n\n\n\n\n\n"
  new_room.save (err) -> 
    if err 
      console.log "ERROR CREATING ROOM\n\n\n\n\n\n\n\n" 
      return
    else 
      console.log "SAVING ROOM\n\n\n\n\n\n\n\n" 
      res.redirect("/room/#{ req.body.room.name }")
  
