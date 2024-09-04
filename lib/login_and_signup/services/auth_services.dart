

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  AuthService._();
  static AuthService authService = AuthService._();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // account create/sign up
  Future<void> signUptWithEmailAndPassword(String email,String password)
  async {
    await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
  }


  // sign in account
  Future<String> makeAnAccountWithEmailAndPassword(String email,String password)
  async {
    try{
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return 'success';
    }
    catch(e)
    {
      return e.toString();
    }
  }


  // sign out
  Future<void> signOutYourAccount()
  async {
    await _firebaseAuth.signOut();
  }

  //get current user
  User? getCurrentUser()
  {

   User? user = _firebaseAuth.currentUser;
   if(user != null)
   {
     log('email :${user.email}');
   }
   return user;
  }

}
