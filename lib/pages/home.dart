// ignore_for_file: prefer_const_constructors

// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:the_ev_life/custom_widgets/custom_forms.dart';
import 'package:the_ev_life/custom_widgets/data_card.dart';
import 'package:the_ev_life/firebase_utils/auth.dart';
import 'package:the_ev_life/pages/pro_analytics.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> {
  AuthService _authService = AuthService();

  void signOut() async {
    await _authService.signOutUser();
    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginForm()));
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: null,
        title: Text('Basic Analytics'),
        // centerTitle: true,
        actions: [
          IconButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ProAnalytics()));
          }, icon: Icon(Icons.analytics_rounded), iconSize: 40.0,),
          IconButton(
            onPressed: signOut,
            icon: Icon(Icons.logout_rounded), iconSize: 40.0),
        ]
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              height: 250,
              // color: Colors.blue,
              decoration: BoxDecoration(
                // borderRadius: BorderRadius.vertical(bottom: Radius.circular(10.0)),
                color: Colors.blue
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 70, 0, 0),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: 
                    <Widget>[
                        Container(height: 75,),
                        DataCard(true),
                        Container(height: 50,),
                        DataCard(false)
                      ]
                    ),
            ),
          ),
        ]
          ),
      )
    );
  }
}