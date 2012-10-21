mongoose = require 'mongoose'


Room = new mongoose.Schema(
  name: String
)

module.exports = mongoose.model 'Room', Room
# whats the difference between module.exports and exports.Room
