 $(document).ready(function(){

  //This creates a user object (using Literal Notation)
  var user = {};

  //Store the appropriate items you will be selecting from the DOM into variables for easy usage
  var userNameInput = $("#user_name"),
    userAgeInput = $("#user_age"),
    userPhoneInput = $("#user_ph"),
    userEmailInput = $("#user_email"),
    userNameError = $("#user_name_error"),
    userAgeError = $("#user_age_error"),
    userPhoneError = $("#user_ph_error"),
    userEmailError = $("#user_email_error"),
    addUserDataForm = $("#add_user_data"),
    displayData = $("#display_data");

  // Initially hide the errors.
  // Check the HTML to see how to select all the items that are error messages.
  $("span").hide();

  //Display function blanks out what is currently being displayed in the display_data area then displays the submitted user data as a list
  function display(user) {
    displayData.append("<li> Name: " + user.name + "</li>");
    displayData.append("<li> Age: " + user.age + "</li>");
    displayData.append("<li> Phone: " + user.phone + "</li>");
    displayData.append("<li> Email: " + user.email + "</li>");
  }

  //ADD_USER FORM SUBMIT EVENT FUNCTION
addUserDataForm.submit(function(event){
    //return false
    event.preventDefault(); //This stops the form from processing (page reload)

    //Get values from user inputs
    var userNameVal = $("#user_name").val();
    var userAgeVal = $("#user_age").val();
    var userPhoneVal = $("#user_ph").val();
    var userEmailVal = $("#user_email").val();


    // Validate the Name. It should return true if the name is greater than or equal 3 characters. If not, it should show the error and return false.
    function validateName() {
      if (userNameVal.length >= 3){
        return true;
      } else {
        userNameError.show();
        return false;
      }
    }

    // Validate the Age. It should return true if the age is a number. If not, it should show the error and return false.
    function validateAge() {
      if ($.isNumeric(userAgeVal)){
        return true;
      } else {
        userAgeError.show();
        return false;
      }
    }

    // Validate the Phone Number. It should return true if the phone number matches the regular expression. If not, it should show the error and return false.
    function validatePhone() {
      var p = /^[0-9]+[0-9]+[0-9]+[_.-]+[0-9]+[0-9]+[0-9]+[_.-]+[0-9]+[0-9]+[0-9]+[0-9]$/; //This is a regular expression for a phone
      if (p.test(userPhoneVal)) {
        return true;
      } else {
        userPhoneError.show();
        return false;
      }
    }

    // Validate the Email. It should return true if the email matches the regular expression. If not, it should show the error and return false.
    function validateEmail() {
      var e = /^[-a-z0-9~!$%^&*_=+}{\'?]+(\.[-a-z0-9~!$%^&*_=+}{\'?]+)*@([a-z0-9_][-a-z0-9_]*(\.[-a-z0-9_]+)*\.(aero|arpa|biz|com|coop|edu|gov|info|int|mil|museum|name|net|org|pro|travel|mobi|[a-z][a-z])|([0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}))(:[0-9]{1,5})?$/; //This is a regular expression for email
      if(e.test(userEmailVal)) {
        return true;
      }
      else {
        userEmailError.show();
        return false;
      }
    }


    // If all of the items validate, you should update the name, age, phone and email of the user and display it
    if(validateName() & validateAge() & validatePhone() & validateEmail()) {
      user = {
        name: userNameVal,
        age: userAgeVal,
        phone: userPhoneVal,
        email: userEmailVal
      }
      display(user);
      console.log(user);
    }
});

  //Clear the object
  // Write a function so that when the clear button is clicked, any data being displayed is erased.

  $("#clear").on("click", function(){
    user = {};
    $("input[type=text], input[type=tel], input[type=email]").val("");
    displayData.empty();
  });


});