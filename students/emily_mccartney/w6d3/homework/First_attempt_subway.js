
var trainLines = {
  lineN: ["TS", "34", "28", "23", "US", "8"],
  lineL: ["L8", "6", "US", "3", "1"],
  lineSix: ["GC", "33", "28", "23", "US", "AP"]
};



function selectFirstLine(line){
    if (line === "lineN"){
        console.log("you have selected line N");
    }
    else if (line === "lineL"){
        console.log("you have selected line L");
    }
    else if (line == "lineSix"){
        console.log("you have selected line 6");
    }
}

function selectFirstStop(line, stop){
    var lineStart = trainLines[line][stop];
        if (line === "lineN"){
            usIndex= trainLines.lineN[4];
            console.log("you have selected stop " + lineStart + " end at " + usIndex);
        }
        else if (line === "lineL"){
            usIndex= trainLines.lineL[2];   
            console.log("you have selected stop " + lineStart + " end at " + usIndex);
        }
        else{
            usIndex= trainLines.lineSix[4];
            console.log("you have selected stop " + lineStart + " end at " + usIndex);
        }    
}

function selectSecondLine(line2){
    if (line2 === "lineN"){
        console.log("you have selected line N");
    }
    else if (line2 === "lineL"){
        console.log("you have selected line L");
    }
    else if (line2 == "lineSix"){
        console.log("you have selected line 6");
    }
}

function selectSecondStop(line2,stop2){
    var lineEnd = trainLines[line2][stop2];
      console.log("you have selected stop " + lineEnd );   
}

selectFirstLine("lineSix");
selectFirstStop("lineSix", "0");
selectSecondLine("lineN");
selectSecondStop("lineN", "2");

function completeTrip(){
    
}
