function handleHTTP(req,res) {
  if (req.method === "GET") {
    if (/^\/\d+(?=$|[\/?#])/.test(req.url)) {
			req.addListener("end",function(){
				req.url = req.url.replace(/^\/(\d+).*$/,"/$1.html");
				static_files.serve(req,res);
			});
			req.resume();
    } else {
      res.writeHead(403);
      res.end("Get outta here");
    }    
  } else {
      res.writeHead(403);
      res.end("Get outta here");
  } 
}

var host = "localhost";
var port = 8006;

var http = require("http");
var http_serv = http.createServer(handleHTTP).listen(port, host);


var ASQ = require("asynquence");

var node_static = require("node-static")

//  __dirname is used in Node to resolve to the current directory
var static_files = new node_static.Server(__dirname);

var io = require("socket.io");

// hijack the server and listen to socket connections as well 
 // must have HTTP connection first then can add a socket 
io.listen(http_serv)