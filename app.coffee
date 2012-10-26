
###
Module dependencies.
###
express = require("express")
mongoose = require("mongoose")
routes = require("./routes")
user = require("./routes/user")
room = require("./routes/room")
http = require("http")
path = require("path")
MongoStore = require('connect-mongo')(express);

settings = 
  db: "secret-bear"
#    collection: "sessions"
#    , host: 
#    , port: 
#    , username:
#    , password:
#    , auto_reconnect:
#    , url: 
#    , mongoose_connection:
#    , clear_interval:
#    , stringify:
  cookie_secret: "COOKIE SECRET"

app = express()
app.configure ->
  app.set "port", process.env.PORT or 3000
  app.set "views", __dirname + "/views"
  app.set "view engine", "ejs"
  app.use express.favicon()
  app.use express.logger "dev"
  app.use express.bodyParser()
  app.use express.methodOverride()
  app.use express.cookieParser settings.cookie_secret
  app.use express.session {
    secret: settings.cookie_secret,
    store: new MongoStore {
      db: settings.db
    }
  }
  app.use app.router
  app.use express.static(path.join(__dirname, "public"))

app.configure "development", ->
  app.use express.errorHandler()
  mongoose.connect 'mongodb://localhost/piano-dev'

app.get "/", routes.index
app.post "/room/new", room.new
app.get "/users", user.list
app.get "/room/:name", room.view




http.createServer(app).listen app.get("port"), ->
  console.log "Express server listening on port " + app.get("port")

