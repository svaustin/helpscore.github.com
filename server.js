var connect = require('connect');

connect.createServer()
  .use(connect.logger())
  .use(connect.static(__dirname))
  .listen(1337);