import 'package:flutter/material.dart';
import 'package:the_ev_life/custom_widgets/custom_forms.dart';
import 'package:the_ev_life/firebase_utils/firebase_service.dart';
import 'package:the_ev_life/pages/home.dart';
// import 'package:the_ev_life/pages/home.dart';
// import 'package:the_ev_life/custom_widgets/charts.dart';
// import 'package:the_ev_life/custom_widgets/custom_forms.dart';
// import 'package:the_ev_life/pages/pro_analytics.dart';

// void main() {
//   runApp(MaterialApp(
//     home: SafeArea(child: ProAnalytics())
//   ));
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseService.initializeFirebase();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: LoginForm(),
    );
  }
}