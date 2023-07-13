// ignore_for_file: prefer_interpolation_to_compose_strings, avoid_print

import 'dart:convert';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:the_ev_life/firebase_utils/auth.dart';
import 'package:the_ev_life/firebase_utils/firestore_service.dart';

class DataCard extends StatefulWidget {
  DataCard(this.isBattery);
  final bool isBattery;
  @override
  _DataCardState createState() => _DataCardState();
}

class _DataCardState extends State<DataCard>{
  
  bool isRequestResolved = false;
  late Future<dynamic> cardData = getCardData();
  // Color iconColor = Colors.blue;

  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose(){
    _stopTimer();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 5), (_) {
      setState(() {
        final data = getCardData();
        cardData = data;
        // cardData = getCardData();
      });
    });
  }

  void _stopTimer() {
    _timer?.cancel();
    _timer = null;
  }

  Future<dynamic> getCardData() async {
    User? user = AuthService().firebaseAuth.currentUser;
    if(user != null){
      print(user.uid);
      var apiUrl = await FirestoreService().readUserDoc(user.uid);
      print(apiUrl['state_data_api']);
      var data = await getData(apiUrl['state_data_api']);
      return data;
      // return apiUrl['state_data_api'] as String;
    } else {
      return null;
    }
  }

  Future<dynamic> getData(String url) async {
    print(url);
    var data = await http.get(Uri.parse(url));
    print(jsonDecode(data.body));
    if(data.statusCode == 200){
      return jsonDecode(data.body);
    }
    return jsonDecode(data.body);
  }

  // final myDataStream = dataStream();

  @override
  Widget build(BuildContext context){
    return FutureBuilder(
            future: cardData,
            builder: (context, snapshotFuture) {
              if(snapshotFuture.hasData){
                final data = snapshotFuture.data!;
                return Card(
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Text( widget.isBattery ? 'Battery' : 'Battery Temperature', style: TextStyle(fontSize: 25.0, color: Colors.grey[900]),),
                        Divider(height: 20.0, color: Colors.grey[450], thickness: 2.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              widget.isBattery ? Icons.battery_5_bar_outlined : Icons.thermostat_outlined, 
                              color: 
                              widget.isBattery ? 
                              (data['Battery'] >= 65 ? 
                              Colors.green : data['Battery'] >= 45 ?
                              Colors.orange :Colors.red) : 
                              (data['Temperature'] <= 27 ?
                               Colors.green : data['Temperature'] <= 35 ?
                               Colors.orange :Colors.red),
                              size: 150.0,
                            ),
                            Container(
                              width: 20.0,
                            ),
                            Text('${widget.isBattery ? data['Battery'] : data['Temperature']}' + (widget.isBattery ? '%':'\u2103'), style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold, color: Colors.grey[900])),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              } else if(snapshotFuture.connectionState == ConnectionState.waiting){
                return const Center(child: CircularProgressIndicator());
              } else {
                // print("SnapshotFuture");
                // print(snapshotFuture.data);
                return const Text("Error occured");
              }
            }
          );}
        }


