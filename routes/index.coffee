Room = require '../models/Room'

#
# * GET home page.
# 
exports.index = (req, res) ->
  # pass all rooms
  all_rooms = Room.find {}
  all_rooms.exec (err, rooms) -> 
    if err
      return handleError err
    else 
      console.log 'GOT HERE BRO \n\n\n\n\n\n\n'
      console.log rooms
      res.render "index",
        title: "Express",
        rooms: rooms
