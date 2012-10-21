mongoose = require 'mongoose'


Room = new mongoose.Schema(
  title: String
  body: String
)

module.exports = mongoose.model 'Room', Room
