module.exports.initialize = function (app, path, basepath) {
  app.get('/', function (req, res) {
    res.sendFile(path.join(basepath, 'views/index.html'));
  });
};
