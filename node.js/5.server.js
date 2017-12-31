function handleHTTP(req,res) {
  if (req.method === "GET") {
    if (req.url === "/") {
      res.writeHead(200, {"Content-type": "text/plain"});
      
      // using ASQ makes a vertical sequence of steps as opposed to the nested setTimeouts below
      // setTimeouts are just stand in for other steps that would actually exist like eading form a DB
      ASQ(function(done){
        setTimeout(function(){
          done(Math.random());
        }, 1000);
      })
      .then(function(done, num){
        setTimeout(function(){
          done("Hello worldsss: " + num);
        }, 1000)
      })
      .val(function(msg){
        res.end(msg);
      });
      
      // setTimeout(function(){
      //   var num = Math.random();
      //   setTimeout(function(){
      //     res.end("Hello worldsss: " + num);
      //   }, 1000);
      // }, 1000);
      // 
      // 
      // res.write("Hello Worldssss")
      // res.end(Math.random().toString());
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