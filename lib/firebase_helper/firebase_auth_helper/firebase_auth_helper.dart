import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:havenmall/constants/constants.dart';
import 'package:havenmall/constants/navigator.dart';
import 'package:havenmall/models/catergories_Model/categories_Model.dart';
import 'package:havenmall/screens/onboarding/signup_Page.dart';

class FirebaseAuthHelper {
  static FirebaseAuthHelper instance = FirebaseAuthHelper();
  final FirebaseAuth auth = FirebaseAuth.instance;
  Stream<User?> get getauthchange => auth.authStateChanges();
  Future<bool> login(
      String emailAddress, String password, BuildContext context) async {
    try {
      showLoader(context);
      final credential = await auth.signInWithEmailAndPassword(
          email: emailAddress, password: password);
      NavigationHelper.pop(context);
      return true;
    } on FirebaseAuthException catch (e) {
      String msg = generateExceptionMessage(e.code.toString());
      NavigationHelper.pop(context);
      showMsg(msg, context);

      return false;
    }
  }

  Future<bool> Signup(
      String emailAddress, String password, BuildContext context) async {
    try {
      showLoader(context);
      final credential = await auth
          .createUserWithEmailAndPassword(
              email: emailAddress, password: password)
          .then((value) => print("Account created succesfully"));

      NavigationHelper.pop(context);
      return true;
    } on FirebaseAuthException catch (e) {
      String msg = generateExceptionMessage(e.code.toString());
      NavigationHelper.pop(context);
      showMsg(msg, context);

      return false;
    }
  }
}
