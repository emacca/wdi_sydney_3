var word = {
  secretWord: "",
  wordList: ['ruby', 'rails', 'javascript', 'array', 'hash', 'underscore', 'sinatra', 'model', 'controller', 'view', 'devise', 'authentication', 'capybara', 'jasmine', 'cache', 'sublime', 'terminal', 'system', 'twitter', 'facebook', 'function', 'google', 'amazon', 'development', 'data', 'design', 'inheritance', 'prototype', 'gist', 'github', 'agile', 'fizzbuzz', 'route', 'gem', 'deployment', 'database'],

  // Selects a random word from the word list sets the secret word
  setSecretWord: function(){
    word.secretWord = _.sample(word.wordList);
  },

  // Takes an array of letters as input and returns an array of two items:
  // 1) A string with the parts of the secret word that have been guessed correctly and underscore for the parts that haven't
  // 2) An array of all the guessed letters that were not in the secret word
  checkLetters: function(guessedLetters){

    var secretWordLetters = this.secretWord.split("");//splitting into individual letters 

    var secretWordWithBlanks = _.map(secretWordLetters, function(letter){
      if (_.contains(guessedLetters,letter)){
       return letter;
      } else { 
        return "_";
      }
    });//returns the secretWords with the the letters guessed and the _ as the ones still to guess
      
    secretWordWithBlanks = secretWordWithBlanks.join(' ');

    var guessedLettersNotInSecretWord = _.difference(guessedLetters, secretWordLetters);//returns the letters that are not in the secret word form the guessed ones
    // var lettersLeftToGuessInSecretWord = _.difference(secretWordLetters, guessedLetters);//letters still to guess 
    
    return [secretWordWithBlanks, guessedLettersNotInSecretWord]
   
  }
};

var player = {
  MAX_GUESSES: 8,
  guessedLetters: [],

  // Takes a new letter as input and updates the game
  // when i use the function it will give it a letter
  makeGuess: function(letter){
    var result = word.checkLetters(letter);//this is the result that is returned when we call the function
    var wordString = document.getElementById("wordString");

    var letter = _.last(letter);    
    this.guessedLetters.push(letter);
    this.guessedLetters = _.uniq(this.guessedLetters);

    wordString.innerHTML = result[0];
    game.updateDisplay(result[0], this.guessedLetters.join(' '), this.MAX_GUESSES - this.guessedLetters.length);

    this.checkWin(result[0]);//only first item
    this.checkLose(this.guessedLetters);
  },

  // Check if the player has won and end the game if so
  checkWin: function(wordString){

    if (_.contains(wordString, "_")){
    } else {
      // document.getElementById("letterField").disabled = true;
      alert("you Win");
      game.resetGame();
    }
  },

  // Check if the player has lost and end the game if so
  checkLose: function(guessedLetters){
    if (guessedLetters.length === this.MAX_GUESSES){//wrong
      alert("you loose the answer is  " + word.secretWord);

      game.resetGame();
    }

  }
};

var game = {
  // Resets the game
  resetGame: function(){
    word.setSecretWord();
    document.getElementById("letterField").value = "";
    player.guessedLetters = [];
    player.makeGuess();
  },

  // Reveals the answer to the secret word and ends the game
  giveUp: function(){
    alert("the answer is " + word.secretWord);
    this.resetGame();
  },

  // Update the display with the parts of the secret word guessed, the letters guessed, and the guesses remaining
  updateDisplay: function(secretWordWithBlanks, guessedLetters, guessesLeft){
    document.getElementById("guessedLettersUsed").innerHTML = guessedLetters;
    document.getElementById("wordString").innerHTML = secretWordWithBlanks;
    document.getElementById("guessesLeft").innerHTML = guessesLeft;
  }
};

window.onload = function(){
  // Start a new game

  game.resetGame();//on load to start a new game and clear what was in there before.

  // Add event listener to the letter input field to grab letters that are guessed
  var letterBox = document.getElementById("letterField");
  letterBox.addEventListener("keyup", function(){
    player.makeGuess(letterBox.value);
  })
  // Add event listener to the reset button to reset the game when clicked
  var resetButton = document.getElementById("resetButton");
  resetButton.addEventListener("click", function(){
    game.resetGame();
  },false);

  // Add event listener to the give up button to give up when clicked
  var giveUpButton = document.getElementById("giveUpButton");
  giveUpButton.addEventListener("click", function(){
    game.giveUp();
  }, false);
};

