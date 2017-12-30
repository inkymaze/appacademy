function printHelp() {
  console.log("3.js (c)");
  console.log("");
  console.log("usage");
  console.log("--help print this help");
  console.log("--file={FILE} read the file of {FILE} and output");
  console.log("");
}

var args = require("minimist")(process.argv.slice(2), { string: "file" });




var hello = require("./helloworld3.js");

// var contents = hello.say(args.file);

// .val is a sync step that replaces .then
hello.say(args.file)
  .val(function(contents) {
    console.log(contents.toString());
  })
  .or(function(err){
    console.error("Error " + err);
  });


// add toString to prevent logging array buffer
