// Userlist data array for filling in info box
var userListData = [];

// DOM Ready =============================================================
$(document).ready(function() {

  // Populate the user table on initial page load
  populateTable();
   
  // Clear text fields on initial page load
  $('#addUser fieldset input').val('');
  $('#editUser fieldset input').val('');
  $('#addUser fieldset select').val('SelectGender'); 
  $('#editUser fieldset select').val('SelectGender');

    
  // Username link click
  $('#userList table tbody').on('click', 'td a.linkshowuser', showUserInfo);
});

  // Add User button click
  $('#btnAddUser').on('click', addUser);

  // Add addUser Reset button click
  $('#btnAddUserResetFields').on('click', resetAddUserFields);

  // Add editUser Reset button click
  $('#btnEditUserResetFields').on('click', resetEditUserFields);

  // Delete User link click
  $('#userList table tbody').on('click', 'td a.linkdeleteuser', deleteUser);

  // Edit User link click
  $('#userList table tbody').on('click', 'td a.linkedituser', populateEditUser);

  // Edit User button click
  $('#btnEditUser').on('click', editUser);
// Functions =============================================================

// Fill table with data
function populateTable() {

  // Empty content string
  var tableContent = '';

  // jQuery AJAX call for JSON
  $.getJSON( '/users/userlist', function( data ) {
      // Stick our user data array into a userlist variable in the global object
      userListData = data;
    // For each item in our JSON, add a table row and cells to the content string
    $.each(data, function(){
      tableContent += '<tr>';
      tableContent += '<td><a href="#" class="linkshowuser" rel="' + this.username + '">' + this.username + '</a></td>';
      tableContent += '<td>' + this.species + '</td>';
      tableContent += '<td><a href="#" class="linkdeleteuser" rel="' + this._id + '">delete</a></td>';
      tableContent += '<td><a href="#" class="linkedituser" rel="' + this._id + '">edit</a></td>';
      tableContent += '</tr>';
    });

    // Inject the whole content string into our existing HTML table
    $('#userList table tbody').html(tableContent);
  });
};

// Show User Info
function showUserInfo(event) {

  // Prevent Link from Firing
  event.preventDefault();

  // Retrieve username from link rel attribute
  var thisUserName = $(this).attr('rel');

  // Get Index of object based on id value
  var arrayPosition = userListData.map(function(arrayItem) { return arrayItem.username; }).indexOf(thisUserName);
    
      // Get our User Object
  var thisUserObject = userListData[arrayPosition];

  //Populate Info Box
  $('#userInfoName').text(thisUserObject.fullname);
  $('#userInfoAge').text(thisUserObject.age);
  $('#userInfoGender').text(thisUserObject.gender);
  $('#userInfoLocation').text(thisUserObject.location);
};

// Add User
function addUser(event) {
  event.preventDefault();

  // Super basic validation - increase errorCount variable if any fields are blank
  var errorCount = 0;
  //$('#addUser input').each(function(index, val) {
//    if($(this).val() === '') { errorCount++; }
//  });
  // Check and make sure errorCount's still at zero
  //if(errorCount === 0) {

    // If it is, compile all user info into one object
    var newUser = {
      'username': $('#addUser fieldset input#inputUserName').val(),
      'species': $('#addUser fieldset input#inputUserSpecies').val(),
      'fullname': $('#addUser fieldset input#inputUserFullname').val(),
      'age': Math.trunc($('#addUser fieldset input#inputUserAge').val()),
      'location': $('#addUser fieldset input#inputUserLocation').val(),
      'gender': $('#addUser fieldset select#selectUserGender').val()
    }
    
    var intNumber = parseInt(newUser.age, 10);
    
    // Specific Field checks
      if (newUser.username==null || newUser.username=="")
        {
          alert("Username must be filled out");
          return false;
        }
      else if (newUser.species==null || newUser.species=="")
        {
          alert("Species must be filled out");
          return false;    
        }
      else if (newUser.fullname==null || newUser.fullname=="")
        {
          alert("Fullname must be filled out");
          return false;             
        }    
      else if (newUser.location==null || newUser.location=="")
        {
          alert("Location must be filled out");
          return false;             
        }
      else if (newUser.gender==null || newUser.gender=="")
        {
          alert("Gender must be filled out");
          return false; 
        }
      else if (newUser.age==null || newUser.age=="")
        {
            if (intNumber < 1)
            {
                alert("Please enter a valid age");
                return false;             
            }
            else if (newUser.age==null || newUser.age=="")
            {
                alert("Age must be filled out");
                return false;
            }
        }  
      else if (isNaN(intNumber) == true)
        {
          alert("Please enter a valid number");
          return false;             
        }
      else if (intNumber < 1)
        {
          alert("Please enter a valid age");
          return false;             
        }
      else if (newUser.gender=="SelectGender")
        {
          alert("Please select from Gender dropdown");
          return false;             
        }
    // Specific Field checks
      
    // Use AJAX to post the object to our adduser service
    $.ajax({
      type: 'POST',
      data: newUser,
      url: '/users/adduser',
      dataType: 'JSON'
    }).done(function( response ) {

      // Check for successful (blank) response
      if (response.msg === '') {

        // Clear the form inputs
        $('#addUser fieldset input').val('');
        $('#addUser fieldset select').val('SelectGender');

        // Update the table
        populateTable();

      }
      else {

        // If something goes wrong, alert the error message that our service returned
        alert('Error: ' + response.msg);

      }
    });
 // }
  //else {
    // If errorCount is more than 0, error out
    //alert('Please fill in all fields');
//    return false;
  //}
};

// Delete User
function deleteUser(event) {

  event.preventDefault();

  // Pop up a confirmation dialog
  var confirmation = confirm('Are you sure you want to delete this user?');

  // Check and make sure the user confirmed
  if (confirmation === true) {

    // If they did, do our delete
    $.ajax({
      type: 'DELETE',
      url: '/users/deleteuser/' + $(this).attr('rel')
    }).done(function( response ) {

      // Check for a successful (blank) response
      if (response.msg === '') {
      }
      else {
        alert('Error: ' + response.msg);
      }

      // Update the table
      populateTable();

    });

  }
  else {

    // If they said no to the confirm, do nothing
    return false;

  }

};

function populateEditUser(event) {

  event.preventDefault();

  // Pop up a confirmation dialog
  //var confirmation = confirm('Are you sure you want to edit this user?');

  // Retrieve username from link rel attribute
  var thisID = $(this).attr('rel');

  // Get Index of object based on id value
  var arrayPosition = userListData.map(function(arrayItem) { return arrayItem._id; }).indexOf(thisID);
    
      // Get our User Object
  var thisUserObject = userListData[arrayPosition];

  //Populate Info Box
  //$('#editUser fieldset span#inputUserID').text(thisUserObject._id);
  $('#editUser fieldset input#inputUserID').val(thisUserObject._id);
  $('#editUser fieldset input#inputUserName').val(thisUserObject.username);
  $('#editUser fieldset input#inputUserSpecies').val(thisUserObject.species);
  $('#editUser fieldset input#inputUserAge').val(thisUserObject.age);
  $('#editUser fieldset input#inputUserLocation').val(thisUserObject.location);
  $('#editUser fieldset select#selectUserGender').val(thisUserObject.gender);
  $('#editUser fieldset input#inputUserFullname').val(thisUserObject.fullname);
    
};

function editUser(event) {
   
  event.preventDefault();
    
  var thisUserID = $('#editUser fieldset input#inputUserID').val();
    
    var editUser = {
      username: $('#editUser fieldset input#inputUserName').val(),
      species: $('#editUser fieldset input#inputUserSpecies').val(),
      fullname: $('#editUser fieldset input#inputUserFullname').val(),
      age: Math.trunc($('#editUser fieldset input#inputUserAge').val()),
      location: $('#editUser fieldset input#inputUserLocation').val(),
      gender: $('#editUser fieldset select#selectUserGender').val()
    }    
    
    
    var intNumber = parseInt(editUser.age, 10);
    
    // Specific Field checks
      if (editUser.username==null || editUser.username=="")
        {
          alert("Username must be filled out");
          return false;
        }
      else if (editUser.species==null || editUser.species=="")
        {
          alert("Species must be filled out");
          return false;    
        }
      else if (editUser.fullname==null || editUser.fullname=="")
        {
          alert("Fullname must be filled out");
          return false;             
        }    
      else if (editUser.location==null || editUser.location=="")
        {
          alert("Location must be filled out");
          return false;             
        }
      else if (editUser.gender==null || editUser.gender=="")
        {
          alert("Gender must be filled out");
          return false;             
        }
      else if (editUser.age==null || editUser.age=="")
        {
            if (intNumber < 1)
            {
                alert("Please enter a valid age");
                return false;             
            }
            else if (editUser.age==null || editUser.age=="")
            {
                alert("Age must be filled out");
                return false;
            }
        }  
      else if (isNaN(intNumber) == true)
        {
          alert("Please enter a valid number");
          return false;             
        }
      else if (intNumber < 1)
        {
          alert("Please enter a valid age");
          return false;             
        }
      else if (editUser.gender=="SelectGender")
        {
          alert("Please select from Gender dropdown");
          return false;             
        }
    // Specific Field checks
    
    
    // Use AJAX to post the object to our adduser service
    $.ajax({
      type: 'PUT',
      data: editUser,
      url: '/users/edituser/' + thisUserID,
      dataType: 'JSON'
    }).done(function( response ) {
       
      // Check for successful (blank) response
      if (response.msg === '') {

        // Clear the form inputs
        $('#editUser fieldset input').val('');
        $('#editUser fieldset select').val('SelectGender');
        // Update the table
        populateTable();

      }
      else {

        // If something goes wrong, alert the error message that our service returned
        alert('Error: ' + response.msg);

      }

    });
};

    
function resetAddUserFields(event) {
    
    event.preventDefault();
    $('#addUser fieldset input').val('');
    $('#addUser fieldset select').val('SelectGender');
    
};

function resetEditUserFields(event) {
    
    event.preventDefault();
    $('#editUser fieldset input').val('');
    $('#editUser fieldset select').val('SelectGender');
    
};  