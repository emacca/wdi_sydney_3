
var trainLines = {
  lineN: ["TS", "34", "28", "23", "US", "8"],
  lineL: ["L8", "6", "US", "3", "1"],
  lineSix: ["GC", "33", "28", "23", "US", "AP"]
};

intersection = "US";


function stationSelect(line, stop1, stop2){
    
    var stationStart = trainLines[line].indexOf(stop1);
    var secondStation = trainLines[line].indexOf(stop2);
        
        stations = []
        if (secondStation <= stationStart){
            for (var i = stationStart; i >= secondStation; i = i - 1){ 
                stations.push(trainLines[line][i]);
            }
        }
        else{
            for (i = stationStart; i<= secondStation; i = i + 1){
                stations.push(trainLines[line][i]);
            }

        }
        var stops = stations.length-1
        return {
            line: line,
            stations: stations,
            stops: stops,
        }
        
}

function completeTrip(startLine, startStation, endLine, endStation){
    if (startLine === endLine){
        var trip = stationSelect(startLine, startStation, endStation);
        console.log(trip.line);
        console.log(trip.stations);
        console.log(trip.stops);
    } 
    else{
        var trip1 = stationSelect(startLine, startStation, intersection);
        var trip2 = stationSelect(endLine, intersection, endStation);
        console.log(trip1.line);
        console.log(trip1.stations);
        console.log(trip2.line);
        console.log(trip2.stations);
        console.log(trip2.stops + trip1.stops);
    }
}



// selectFirstLine("lineSix");
// selectFirstStop("lineSix", "GC");
// selectSecondLine("lineN");
// selectSecondStop("lineN", "2");


