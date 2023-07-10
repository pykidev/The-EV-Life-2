// ignore_for_file: unused_element

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<UserCredential?> registerUser(String email, String password) async {
    try{
      final UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(email: email 
      , password: password);
      return userCredential;
    } on FirebaseException catch(e) {
      print(e.toString());
      return null;
    }
  } 

  Future<UserCredential?> signInUser(String email, String password) async {
    try{
      final UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(email: email 
      , password: password);
      return userCredential;
    } on FirebaseException catch(e) {
      print(e.toString());
      return null;
    }

    
  } 
  Future<void> signOutUser() async {
    await _firebaseAuth.signOut();
  }  
}