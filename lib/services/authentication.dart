import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:inmotion/views/main/feed.dart';

class Auth {
  static void signUp(
    String name,
    String email,
    String password,
    BuildContext context,
  ) async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    Fluttertoast.showToast(msg: "User registered successfully");
  }

  static void signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
  }

  static Future<void> signInWithEmail(
      {required String email,
      required String password,
      required BuildContext context}) async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Feed()));
  }
}
