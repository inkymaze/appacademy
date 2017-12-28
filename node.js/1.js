function printHelp() {
  console.log("1.js (c) Nick Cannon");
  console.log("");
  console.log("usage");
  console.log("--help print this help");
  console.log("");
}

var args = require("minimist")(process.argv.slice(2), { string: "name" });

if (args.help || !args.name) {
  printHelp();
  process.exit(1);
}
let name = args.name;

console.log("HELLO " + name);
