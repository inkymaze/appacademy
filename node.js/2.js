function printHelp() {
  console.log("2.js (c)");
  console.log("");
  console.log("usage");
  console.log("--help print this help");
  console.log("--file={FILE} read the file of {FILE} and output");
  console.log("");
}

var args = require("minimist")(process.argv.slice(2), { string: "file" });

if (args.help || !args.file) {
  printHelp();
  process.exit(1);
}


var hello = require("./helloworld.js");

// var contents = hello.say(args.file);

// callback is given an error as the first argument as convention
hello.say(args.file, function(err,contents){
  if (err){
    console.error("Error " + err);
  } else {

  console.log(contents.toString());
}
});

// add toString to prevent logging array buffer
