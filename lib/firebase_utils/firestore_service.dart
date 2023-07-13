import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final db = FirebaseFirestore.instance;

  void addUserDoc(String userUid){
    final userdata = {
      'username': userUid,
      'state_data_api': "https://kissa.pythonanywhere.com/api/vehicle/data/",
      'log_data_api': "https://kissa.pythonanywhere.com/api/vehicle/data/battery_log/"
    };

    db.collection('users').doc(userUid).set(userdata)
    .onError((error, stackTrace){
      print(error);
    });
  }

  Future<dynamic> readUserDoc(String userUid) async {
    final doc = await db.collection('users').doc(userUid).get().then((doc){
      return doc;
    });
    return doc;
  }

}