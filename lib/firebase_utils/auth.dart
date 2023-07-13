// ignore_for_file: unused_element

// import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  User? get currentUser => firebaseAuth.currentUser;
  Stream<User?> get authStateChanges => firebaseAuth.authStateChanges();
  
  Future<void> registerUser(String email, String password) async {
    try{
      await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      // return userCredential;
    } on FirebaseException catch(e) {
      print(e.toString());
      // return null;
    }
  } 

  Future<void> signInUser(String email, String password) async {
    try{
      await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      // return userCredential;
    } on FirebaseException catch(e) {
      print(e.toString());
      // return null;
    }

    
  } 
  Future<void> signOutUser() async {
    await firebaseAuth.signOut();
  }  
}