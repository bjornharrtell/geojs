express = require 'express'


app = express()

Server = require 'postgresql-http-server/lib/server'
server = new Server app
server.setup
  dbhost: 'localhost'
  dbport: 5432
  database: 'test'
  user: 'postgres'
  password: 'postgres'
  
app.get '/hello.txt', (req, res) ->
  body = 'Hello World'
  res.setHeader 'Content-Type', 'text/plain'
  res.setHeader 'Content-Length', body.length
  res.end body
  
app.listen 3000
console.log 'Listening on port 3000'
