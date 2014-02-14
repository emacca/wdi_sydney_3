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
   deposit(checking);
  };

  document.getElementById("savingsDeposit").onclick = function(event){
    // Any code you put in here will be run when the savingsDeposit button is clicked
    deposit(savings);
  };

  document.getElementById("checkingWithdraw").onclick = function(event){
    // Any code you put in here will be run when the checkingWithdraw button is clicked
    withdraw(checking,savings);
  };

  document.getElementById("savingsWithdraw").onclick = function(event){
    // Any code you put in here will be run when the savingsWithdraw button is clicked
    withdraw(savings,checking);
  };

  function checkColour(array){
    if ( array[0] === 0){
      document.getElementById(array[2]).style.background = "red";  
    }
    else{
      document.getElementById(array[2]).style.background = "#E3E3E3"; 
    }
  };

  function deposit(account){
    var amount = document.getElementById(account[1]).value;
    document.getElementById(account[1]).value = "";
    account[0] = account[0] + parseInt(amount);
    balance = "$".concat(account[0]);
    document.getElementById(account[2]).innerHTML = balance;
    checkColour(account);
  };

  function withdraw(account1, account2){
    var amount = document.getElementById(account1[1]).value;
        document.getElementById(account1[1]).value = "";
      if (parseInt(amount) <= (account1[0] + account2[0])){

        if (parseInt(amount) <= account1[0]){
          account1[0] = account1[0] - parseInt(amount);          
        }
        else{
          amount = amount - account1[0];
          account1[0] = 0;
          account2[0] = account2[0]- amount;
        }
        balance1 = "$".concat(account1[0]);
        document.getElementById(account1[2]).innerHTML = balance1;
        balance2 = "$".concat(account2[0]);
        document.getElementById(account2[2]).innerHTML = balance2;
      }
    checkColour(account1);
    checkColour(account2);
  };

};

