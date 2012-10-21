Room = require '../models/Room'
#
# * GET users listing.
# 
exports.view = (req, res) ->
  view_room = Room.find { name: req.params.name }
  view_room.exec (err, room) ->
    if err
      return handleError err
    else 
      console.log 'hi\n\n\n\n\n'
      console.log room
      res.render "room", name: room.name

exports.new = (req, res) ->
  # console.log name
  # new_room = new Room req.body.room
  new_room = new Room req.body.room  
  new_room.save (err) -> 
    if err 
      console.log "ERROR SAVING ROOM\n\n\n\n\n\n\n\n" 
      return handleError err
    else 
      console.log "SAVING ROOM\n\n\n\n\n\n\n\n" 
      res.redirect("/room/#{ req.body.room.name }")
  
