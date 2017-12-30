function readFile(filename) {
  
  return ASQ(function(done) {
    var stream = fs.createReadStream(filename);
    var contents = "";

// creates a backup file that called during the flow with interrupting the functions below 
    stream.pipe( fs.createWriteStream(filename+".backup"))
    // by default the stream will run to completion
    // until its exhausted the contents of the file 
    //  if the "data" is bigger then nodes internal buffer size then data will log until everything is cached
    stream.on("data",function(chunk){
      contents += chunk;
    });
    // checks if stream is done 
    stream.on("end", function() {
      done(contents);
    });
    
  })
  // creating the sequence
  var sq = ASQ();

  //  node is famous for error first callbacks
  //  errfcb == error first call back pulled from asynquence library
  fs.readFile(filename, sq.errfcb() );

  return sq;
}


function delayMsg(done, contents) {
  setTimeout(function(){
    done(contents);
  }, 1000);
}

function say(filename) {
  return readFile(filename)
    .then(delayMsg);
}


var fs = require("fs");
var ASQ = require("asynquence");
// no need to save contib to a variable because it attaches to asynquence
require("asynquence-contrib");

module.exports.say = say;
