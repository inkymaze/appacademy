const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});



class Game {
  constructor() {
    this.stacks = [[3,2,1],[],[]];
  }

  // allows invalid move 
  isValidMove(startIdx, endIdx) {
    let lastVal = startIdx.length-1;
    let lastVal2 = endIdx.length-1;
    let tow1 = startIdx[lastVal];
    let tow2 = endIdx[lastVal2];
    if (tow1 === -1){
      return false;
    }else if (tow2 === -1) {
      return true;
    }else if (tow2 > tow1) {
      return false;
    }
    return true;
  }

  run(){
    this.promptMove((startStack,endStack)=> {
      this.move(startStack, endStack);
      // console.log(this);
      if (this.isWon() === false){
        this.run();
      }
      else {
        console.log('Game over!');
      }
    });
  }

  move(startStack, endStack){
    if (this.isValidMove(startStack, endStack)) {
      let pop = this.stacks[startStack].pop();
      this.stacks[endStack].push(pop);
    }
  }

  promptMove(callback) {
    console.log(JSON.stringify(this.stacks));
    reader.question("Which stack would you like to move from?",
     function(startStack) {
      reader.question("Which stack would you like to move to?",
       function(endStack) {
        startStack = parseInt(startStack);
        endStack = parseInt(endStack);
        callback(startStack,endStack);
      });
    });
  }

  isWon() {
    if (this.stacks[2][2] === 1) {
      if (this.stacks[2][0] === 3){
        console.log("You Win!");
        reader.close;
        return true;
      }
    }
    return false;
  }
}
module.exports = Game;
