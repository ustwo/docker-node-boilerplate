var express = require('express');
var fs = require('fs');
var morgan = require('morgan');
var path = require('path');

// CSS dependencies
var stylus = require('stylus');
var nib = require('nib');

// Internal dependencies
var app = express();
var env = app.get('env') || 'development';
var routes = require('./routes');

var logFormat = JSON.stringify({
  "method": ":method",
  "url": ":url",
  "status": ":status",
  "date": ":date[iso]",
  "duration": ":response-time ms",
  "content_length": ":res[content-length]"
});

// Logging requests
app.use(morgan(logFormat));

app.set('views', path.join(__dirname, 'views'));
app.use(stylus.middleware({
  src: path.join(__dirname, '../src'),
  dest: path.join(__dirname, '../client'),
  compress: false,
  debug: true,
  linenos: true,
  force: true,
  sourcemap: true,
  compile: function (str, path) {
    return stylus(str).set('filename', path).use(nib())
  }
}));
app.use(express.static(path.join(__dirname, '../client')));

routes.initialize(app, path, __dirname);

app.listen(8888, function () {
  console.log('App up and running');
});
