// import 'package:firebase_auth/firebase_auth.dart';
import 'package:the_ev_life/custom_widgets/custom_forms.dart';
import 'package:the_ev_life/firebase_utils/auth.dart';
import 'package:flutter/material.dart';
import 'package:the_ev_life/pages/home.dart';



class WidgetTree extends StatefulWidget {
  const WidgetTree({Key? key}): super(key: key);

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context){
    return StreamBuilder(
      stream: AuthService().authStateChanges,
      builder: (context, snapshot) {
        if(snapshot.hasData) {
          return Home();
        } else {
          return LoginForm();
        }
      },
    );
  }
}