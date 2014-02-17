window.onload = function(){
  var checking = [20, "checkingAmount", "balance1"];
  var savings = [100, "savingsAmount", "balance2"];
  
  displayBalance(checking);
  displayBalance(savings);

  document.getElementById("checkingDeposit").onclick = function(event){
   deposit(checking);
  };

  document.getElementById("savingsDeposit").onclick = function(event){
    deposit(savings);
  };

  document.getElementById("checkingWithdraw").onclick = function(event){
    withdraw(checking,savings);
  };

  document.getElementById("savingsWithdraw").onclick = function(event){
    withdraw(savings,checking);
  };

// takes in account array and validates that it is an integer.
// adds the amount entered to account total.
// calls display function to update balance on screen.
// For both savings and checking
  function deposit(account){
    var amount = document.getElementById(account[1]).value;
    if (validateAmount(amount)) {
      account[0] = account[0] + parseFloat(amount);
      displayBalance(account);
      }
    else {
      alert("Enter a valid number");
    }
    document.getElementById(account[1]).value = "";
  };

// takes in both account arrays.
// validates that the input is an integer.
// checks that the amount is less that account1 + account2.
// if so, minus amount from account1 and any remaining from account2.

  function withdraw(account1, account2){
    var amount = document.getElementById(account1[1]).value;
    if (validateAmount(amount)){
        if (parseFloat(amount) <= (account1[0] + account2[0])){
          if (parseFloat(amount) <= account1[0]){
            account1[0] = account1[0] - parseFloat(amount);          
          }
          else{
            amount = amount - account1[0];
            account1[0] = 0;
            account2[0] = account2[0]- amount;
          }
        displayBalance(account1);
        displayBalance(account2);
        }
        else {
          alert("You don't have enough money")
        }
    }
    else {
      alert("Enter a valid number");
    }
    document.getElementById(account1[1]).value = "";
  };
  
  function validateAmount(amount){
    var re = /\d/;
    return re.test(amount);
  };

  function displayBalance(account){
    document.getElementById(account[2]).innerHTML = "$".concat(account[0].toFixed(2));
    checkColour(account);
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

