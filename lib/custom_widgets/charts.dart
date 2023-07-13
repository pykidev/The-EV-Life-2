// ignore_for_file: prefer_interpolation_to_compose_strings

import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:async';
import 'dart:math' as math;

import 'package:the_ev_life/firebase_utils/auth.dart';
import 'package:the_ev_life/firebase_utils/firestore_service.dart';

class RealTimeChart extends StatefulWidget {
  
  bool isBattery = true;
  RealTimeChart(this.isBattery, {super.key});
  @override
  _RealTimeChartState createState() => _RealTimeChartState();
}

class _RealTimeChartState extends State<RealTimeChart>{
  late Future<List<ChartData>> dataList;
  // List<ChartData> dataListTemp = [];
  // late var dataList;

  // Timer? _timer;

  @override
  void initState() {
    super.initState();
    // dataList = getChartData() as Future<List<ChartData>>;
  }

  // @override
  // void dispose(){
  //   _stopTimer();
  //   super.dispose();
  // }

  // void _startTimer() {
  //   _timer = Timer.periodic(Duration(seconds: 1), (_) {
  //     fetchData();
  //   });
  // }

  // void _stopTimer() {
  //   _timer?.cancel();
  //   _timer = null;
  // }

  // double _getRandomValue() {
  //   final random = math.Random();
  //   return random.nextDouble() * 100;
  // }

  Future<dynamic> getChartData() async {
    User? user = AuthService().firebaseAuth.currentUser;
    if(user != null){
      print(user.uid);
      var apiUrl = await FirestoreService().readUserDoc(user.uid);
      print(apiUrl['log_data_api']);
      var data = await getData(apiUrl['log_data_api']);
      return data;
      // if(data){
        
      //   }
      // }
    } else {
      return null;
    }
  }
  
  Future<dynamic> getData(String url) async {
    print(url);
    var data = await http.get(Uri.parse(url + '/1'));
    print(jsonDecode(data.body));
    print((jsonDecode(data.body) as Map)['log_data']);
    // if(data.statusCode == 200){
    //   return jsonDecode(data.body);
    // }
    return widget.isBattery ? (jsonDecode(data.body) as Map)['log_data'] : (jsonDecode(data.body) as Map)['temp_data'];
  }

  // Future<void> fetchData() async{
  //   final apiKey = '51c2bf8d80a941b1a81173409232706';
  //   final response = await http.get(Uri.parse('http://api.weatherapi.com/v1/current.json?key=$apiKey&q=London&aqi=no'));
    
  //   if(response.statusCode == 200) {
  //     final jsonData = jsonDecode(response.body);
  //     final temperature = jsonData['current']['temp_c'].toDouble() + math.Random().nextDouble()*10;

  //     setState(() {
  //       data.add(ChartData(DateTime.now(), temperature));
  //       if(data.length > 50){
  //         data.removeAt(0);
  //       }
  //     });
  //   } else {
  //     print('Fetch has failed');
  //   }
  // }

  @override
  Widget build(BuildContext context){
    return  FutureBuilder(
      future: getChartData(),
      builder:(context,snapshot){
        if(snapshot.hasError){
          return const Text('Error has occurred');
        } else if(snapshot.hasData){
          print("Snapshot data");
          print(snapshot.data!);
          List<ChartData> dataSent = [];
          if(snapshot.data != null){
            for(int i = 0; i < snapshot.data?.length ; i++){ 
              dataSent.add(ChartData(DateTime(DateTime.now().hour+i), snapshot.data[i]));
            }
          }
          return SfCartesianChart(
            primaryXAxis: DateTimeAxis(),
            plotAreaBackgroundColor: Colors.black,
            series: <LineSeries<ChartData, DateTime>>[
              LineSeries<ChartData,DateTime>(
                dataSource: dataSent,
                xValueMapper: (ChartData data, _) => data.time, 
                yValueMapper: (ChartData data, _) => data.value,
                color: Colors.yellow,
              )
            ]);
        } else {
          return Center(child:CircularProgressIndicator());
        }
        });
      
    
  }
}

class ChartData {
  final DateTime time;
  final double value;

  ChartData(this.time, this.value);
}