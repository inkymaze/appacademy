function readFile(filename) {
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
