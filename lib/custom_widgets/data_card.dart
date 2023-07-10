import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DataCard extends StatefulWidget {
  DataCard(this.isBattery);
  final bool isBattery;
  @override
  _DataCardState createState() => _DataCardState();
}

class _DataCardState extends State<DataCard>{
  
  bool isRequestResolved = false;
  double data = 0.0;
  // Color iconColorBattery = Colors.green;
  Color iconColor = Colors.blue;
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
      getCardData('http://api.weatherapi.com/v1/current.json?q=London&aqi=no&key=', '51c2bf8d80a941b1a81173409232706');
    });
  }

  void _stopTimer() {
    _timer?.cancel();
    _timer = null;
  }

  Future<void> getCardData(String url, String apikey) async {

    final response = await http.get(Uri.parse(url + apikey));
    if(response.statusCode == 200){
      final jsonData = jsonDecode(response.body);
      setState(() {
        if(widget.isBattery){
          data = jsonData['current']['temp_c'].toDouble();
          iconColor =  data >= 75 ? Colors.green: data >= 45 ? Colors.orange : Colors.red;
        } else {
          data = jsonData['current']['temp_c'].toDouble();
          iconColor =  data <= 25 ? Colors.blue: data <= 45 ? Colors.orange : Colors.red;
        }
      });
    }
  }

  
  @override
  Widget build(BuildContext context){
    return Card(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Text( widget.isBattery ? 'Battery' : 'Battery Temperature'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(
                  widget.isBattery ? Icons.battery_5_bar_outlined : Icons.thermostat_outlined, 
                  color: iconColor,
                  size: 150.0,
                ),
                Container(
                  width: 20.0,
                ),
                Text('$data' + (widget.isBattery ? '%':'\u2103')),
              ],
            )
          ],
        ),
      ),
    );
  }
}