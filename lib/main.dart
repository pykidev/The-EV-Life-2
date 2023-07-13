import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:the_ev_life/custom_widgets/custom_forms.dart';
// import 'package:the_ev_life/firebase_utils/firebase_service.dart';
import 'package:the_ev_life/widget_tree.dart';
// import 'firebase_utils/firestore_service.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      home: WidgetTree(),
    );
  }
}