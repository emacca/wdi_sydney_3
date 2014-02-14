//Home Work Exchange Rates
//POUNDS
function australianToPounds(number){
    var exchangeRate = 0.54;
    var dollar = number;
    result = dollar * exchangeRate;
    console.log("Converting $" + number +" AUD to pounds is" + " \u00A3" + result)
}
australianToPounds(25)

function poundsToAustralian(number){
    var exchangeRate = 1.84;
    var pound = number;
    result = pound * exchangeRate;
    console.log("Converting " + "\u00A3" + number +" pounds to AUD is" + " $" + result)
}
poundsToAustralian(25)


//NZ
function australianToNz(number){
    var exchangeRate = 1.08;
    var dollar = number;
    result = dollar * exchangeRate;
    console.log("Converting $" + number +" AUD to NZD is $" + result)
}
australianToNz(25)

function nzToAustralian(number){
    var exchangeRate = 0.93;
    var nz = number;
    result = nz * exchangeRate;
    console.log("Converting $" + number +" NZD to AUD is" + " $" + result)
}
nzToAustralian(25)