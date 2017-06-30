class Clock{
  constructor(){
    this.currentTime = new Date();
    this.hours = this.currentTime.getHours();
    this.minutes = this.currentTime.getMinutes();
    this.seconds = this.currentTime.getSeconds();

    setInterval(this._tick.bind(this),1000);
  }
  printTime(){
    console.log(this.hours + ' ' + this.minutes  + ' ' + this.seconds);
  }
  _tick(){
    this.seconds += 1;
    if (this.seconds === 60){
      this.seconds = 0;
      this.minutes += 1;
      if (this.minutes === 60){
        this.minutes = 0;
        this.hours += 1;
        if (this.hours === 24){
          this.hours = 0;
        }
      }
    }
    this.printTime();
  }
}
// const clock = new Clock();
const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function addNumbers(sum, numsLeft, completionCallback) {
  if (numsLeft === 0 ){
    completionCallback(sum);
  }
  reader.question("What number would you like to add?", function (res){
    numsLeft -= 1;
    res = parseInt(res);
    sum += res;
    console.log(sum);
    addNumbers(sum, numsLeft, completionCallback);
  });
}
// addNumbers(0,3, sum => console.log(`Total Sum: ${sum}`));
// el1 = [el2, el2 = el1][0]
function askIfGreaterThan(el1,el2, callback){
  reader.question(`Is ${el1} greater than ${el2}?`,function (res){
    if (res === 'yes'){
      callback(true);
    }
    else{
      callback(false);
    }
  });
}

function innerBubbleSortLoop(arr,i,madeAnySwaps){
  if ( i < (arr.length-1)){
    askIfGreaterThan(arr[i],arr[i+1], (isGreaterThan) => {
      if (isGreaterThan) {
        arr[i] = [arr[i+1], arr[i+1] = arr[i]][0];
        madeAnySwaps = true;
      }
      innerBubbleSortLoop(arr, i + 1, madeAnySwaps);
    });
  } else {
    outerBubbleSortLoop(arr, i, madeAnySwaps);
  }
}


function outerBubbleSortLoop(arr, i, madeAnySwaps){
  if (madeAnySwaps === false){
    reader.close();
    console.log(arr);
    return;
  }
  innerBubbleSortLoop(arr,0,false);
}

function absurdBubbleSort(arr,sortCompletionCallback){
  let madeAnySwaps = true;
  innerBubbleSortLoop(arr, 0, madeAnySwaps);
}

// absurdBubbleSort([3,5,1]);


Function.prototype.myBind = function(context){
  return () => this.apply(context);
};

class Lamp {
  constructor() {
    this.name = "a lamp";
  }
}
const turnOn = function() {
   console.log("Turning on " + this.name);
};
//
// const lamp = new Lamp();
//
// // turnOn(); // should not work the way we want it to
//
// const boundTurnOn = turnOn.bind(lamp);
// const myBoundTurnOn = turnOn.myBind(lamp);
//
// boundTurnOn(); // should say "Turning on a lamp"
// myBoundTurnOn(); // should say "Turning on a lamp"
