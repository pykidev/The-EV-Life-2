import 'package:firebase_core/firebase_core.dart';

class FirebaseService{
  static Future<FirebaseApp> initializeFirebase() async {
    final FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }
}