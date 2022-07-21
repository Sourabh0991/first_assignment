import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_assignment/components/loader.dart';
import 'package:first_assignment/values/firebase_credentials.dart';
import 'package:first_assignment/views/home.dart';
import 'package:first_assignment/values/string_values.dart';
import 'package:first_assignment/models/user_model.dart' as user_model;

class FirebaseServices {
  static attemptLogin(user, context) async {
    Loader.showLoader(context);

    FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: user[StringValues.emailIdKey],
            password: user[StringValues.passwordKey])
        .then((value) {
      Fluttertoast.showToast(
          msg: StringValues.loginSuccessMsg,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          webBgColor: "green",
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);

      Navigator.pop(context);

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: ((context) => const Home())));
    }).onError((error, stackTrace) {
      Fluttertoast.showToast(
          msg: StringValues.loginFailedMsg,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          webBgColor: "red",
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      Navigator.pop(context);
    });
  }

  static Stream<List<user_model.User>> getUsers() => FirebaseFirestore.instance
      .collection(FirebaseCredentials.collectionName)
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map((doc) => user_model.User.fromJson(doc.data()))
          .toList());

  static createUser(user, formKey) async {
    final firebaseUser = FirebaseFirestore.instance
        .collection(FirebaseCredentials.collectionName)
        .doc();

    user.id = firebaseUser.id;

    final json = user.toJson();

    await firebaseUser.set(json).then((value) {
      Fluttertoast.showToast(
          msg: StringValues.registrationSuccessMsg,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          webBgColor: "green",
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
    }).onError((error, stackTrace) {
      Fluttertoast.showToast(
          msg: StringValues.registrationFailedMsg,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          webBgColor: "red",
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }).whenComplete(() => {formKey.currentState!.reset()});
  }

  static Future updateUser(selectedUser) async {
    final firebaseUser = FirebaseFirestore.instance
        .collection(FirebaseCredentials.collectionName)
        .doc(selectedUser.id);

    final json = selectedUser.toJson();

    await firebaseUser.update(json);
  }

  static Future deleteUser(id) async {
    final firebaseUser = FirebaseFirestore.instance
        .collection(FirebaseCredentials.collectionName)
        .doc(id);

    await firebaseUser.delete();
  }
}
