function printHelp() {
  console.log("2.js (c) Nick Cannon");
  console.log("");
  console.log("usage");
  console.log("--help print this help");
  console.log("--file={NAME} read the file of {NAME} and output");
  console.log("");
}

var args = require("minimist")(process.argv.slice(2), { string: "file" });

if (args.help || !args.name) {
  printHelp();
  process.exit(1);
}
