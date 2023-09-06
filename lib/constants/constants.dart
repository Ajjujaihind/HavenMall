// Ignore lint rule about non-constant identifier names for this file.
import 'package:flutter/material.dart'; // Import Flutter Material package.

// Import Fluttertoast package for showing toast messages.
import 'package:fluttertoast/fluttertoast.dart';

// Function to show a toast message with provided 'msg' and 'context'.
void showMsg(String msg, BuildContext context) {
  // Show a toast message using the Fluttertoast plugin.
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: Theme.of(context).primaryColor,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

// Function to show a loading indicator dialog.
showLoader(BuildContext context) {
  // Create an AlertDialog with a circular loading indicator.
  AlertDialog alert = AlertDialog(
    content: Builder(
      builder: (context) {
        return SizedBox(
          height: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
              SizedBox(
                height: 18,
              ),
              Text(
                "Loading....",
                style: TextStyle(color: Colors.black),
              )
            ],
          ),
        );
      },
    ),
  );

  // Show the AlertDialog as a dialog.
  showDialog(
    barrierDismissible:
        false, // Prevent dismissing the dialog by tapping outside.
    context: context,
    builder: (context) {
      return alert;
    },
  );
}

// Function to generate an error message based on an 'exceptionCode'.
String generateExceptionMessage(String exceptionCode) {
  switch (exceptionCode) {
    case 'invalid-email':
      return 'The email address is invalid.';

    case 'wrong-password':
      return 'The password is incorrect.';

    case 'user-not-found':
      return 'The user does not exist.';

    case 'too-many-requests':
      return 'You have made too many requests recently.';

    case 'operation-not-allowed':
      return 'The operation is not allowed.';

    default:
      return exceptionCode
          .toString(); // Return the provided code as a string if not recognized.
  }
}

// Function for login validation, checking if 'email' and 'password' are valid.
bool loginValidation(String email, String password, BuildContext context) {
  if (email.isEmpty && password.isEmpty) {
    showMsg("Email and password is Empty",
        context); // Show a message if both email and password are empty.
    return false; // Return false to indicate validation failed.
  } else if (email.isEmpty) {
    showMsg("Email is Empty", context); // Show a message if email is empty.
    return false; // Return false to indicate validation failed.
  } else if (password.isEmpty) {
    showMsg(
        "Password is Empty", context); // Show a message if password is empty.
    return false; // Return false to indicate validation failed.
  }
  return true; // Return true if validation passes (both email and password are provided).
}

// Function for login validation, checking if 'email' and 'password' are valid.
bool signupValidation(String name, String phone, String email, String password,
    BuildContext context) {
  if (email.isEmpty && password.isEmpty && name.isEmpty && phone.isEmpty) {
    showMsg("All fileds are empty",
        context); // Show a message if both email and password are empty.
    return false; // Return false to indicate validation failed.
  } else if (name.isEmpty) {
    showMsg("Name is Empty", context); // Show a message if email is empty.
    return false; // Return false to indicate validation failed.
  } else if (phone.isEmpty) {
    showMsg("Phone is Empty", context); // Show a message if password is empty.
    return false; // Return false to indicate validation failed.
  } else if (email.isEmpty) {
    showMsg("Email is Empty", context); // Show a message if email is empty.
    return false; // Return false to indicate validation failed.
  } else if (password.isEmpty) {
    showMsg(
        "Password is Empty", context); // Show a message if password is empty.
    return false; // Return false to indicate validation failed.
  }
  return true; // Return true if validation passes (both email and password are provided).
}
