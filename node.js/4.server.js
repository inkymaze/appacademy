function handleHTTP(req,res) {
  res.end("Hellow Worldssss " +  Math.random());
}


var host = "localhost";
var port = 8006;

var http = require("http");
var http_serv = http.createServer(handleHTTP).listen(port, host);



