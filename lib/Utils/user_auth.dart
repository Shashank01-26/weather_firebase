import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserAuth{
  static Future<User?> loginUsingEmailPassword({
        required String email,
        required String password,
        required BuildContext context}) async{
    FirebaseAuth auth = FirebaseAuth.instance;

    User? user;
    try{
      UserCredential userCredential = await auth.signInWithEmailAndPassword(email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch(e){
      if(e.code == "user-not-found"){
        print("No user found for ${email}");
      } else if(e.code == "wrong-password"){
        print("Wrong password provided");
      } else{
        print("\n\nError: ${e.message}");
      }
    } catch(e){
      print("Error: $e");
    }
    return user;
  }

}