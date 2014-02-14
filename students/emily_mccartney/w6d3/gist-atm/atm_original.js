// https://developer.mozilla.org/en-US/docs/Web/API/GlobalEventHandlers.onload
// The load event fires at the end of the document loading process.
// At this point, all of the objects in the document are in the DOM,
// and all the images and sub-frames have finished loading.
window.onload = function(){
  var checking = [0, "checkingAmount", "balance1"];
  var savings = [0, "savingsAmount", "balance2"];
  
  checkColour(checking);
  checkColour(savings);

  // https://developer.mozilla.org/en-US/docs/Web/API/GlobalEventHandlers.onclick
  // The click event is raised when the user clicks on an element.
  document.getElementById("checkingDeposit").onclick = function(event){
    var cAmount = document.getElementById(checking[1]).value
    checking[0] = checking[0] + parseInt(cAmount);
    cBalance = "$".concat(checking[0]);
    document.getElementById(checking[2]).innerHTML = cBalance;
    checkColour(checking);
  };

  document.getElementById("savingsDeposit").onclick = function(event){
    // Any code you put in here will be run when the savingsDeposit button is clicked
    var sAmount = document.getElementById(savings[1]).value
    savings[0] = savings[0] + parseInt(sAmount);
    sBalance = "$".concat(savings[0]);
    document.getElementById(savings[2]).innerHTML = sBalance;
    checkColour(savings);
  };

  document.getElementById("checkingWithdraw").onclick = function(event){
    // Any code you put in here will be run when the checkingWithdraw button is clicked
    var cAmount = document.getElementById(checking[1]).value
      if (parseInt(cAmount) <= (checking[0] + savings[0])){

        if (parseInt(cAmount) <= checking[0]){
          checking[0] = checking[0] - parseInt(cAmount);          
        }
        else{
          cAmount = cAmount - checking[0];
          checking[0] = 0;
          savings[0] = savings[0]- cAmount;
        }
        cBalance = "$".concat(checking[0]);
        document.getElementById(checking[2]).innerHTML = cBalance;
        sBalance = "$".concat(savings[0]);
        document.getElementById(savings[2]).innerHTML = sBalance;
      }
    checkColour(checking);
    checkColour(savings);
  };

  document.getElementById("savingsWithdraw").onclick = function(event){
    // Any code you put in here will be run when the savingsWithdraw button is clicked
    var sAmount = document.getElementById(savings[1]).value
      if (parseInt(sAmount) <= (savings[0]) + (checking[0])){

        if (parseInt(sAmount) <= savings[0]){
          savings[0] = savings[0] - parseInt(sAmount);
        }
        else{
        sAmount = sAmount - savings[0];
          savings[0] = 0;
          checking[0] = checking[0]- sAmount;
        }
        cBalance = "$".concat(checking[0]);
        document.getElementById(checking[2]).innerHTML = cBalance;
        sBalance = "$".concat(savings[0]);
        document.getElementById(savings[2]).innerHTML = sBalance;
      }
    checkColour(checking);
    checkColour(savings);
  };

  function checkColour(array){
    if ( array[0] === 0){
      document.getElementById(array[2]).style.background = "red";  
    }
    else{
      document.getElementById(array[2]).style.background = "#E3E3E3"; 
    }
  };

};

