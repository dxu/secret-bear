mongoose = require 'mongoose'


Room = new mongoose.Schema(
  title: String
  body: String
)

exports.Room = mongoose.model 'Room', Room
