import 'dart:convert';
import'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:async';
import 'dart:math' as math;

class RealTimeChart extends StatefulWidget {
  @override
  _RealTimeChartState createState() => _RealTimeChartState();
}

class _RealTimeChartState extends State<RealTimeChart>{
  List<ChartData> data = [];

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
    _timer = Timer.periodic(Duration(seconds: 1), (_) {
      fetchData();
    });
  }

  void _stopTimer() {
    _timer?.cancel();
    _timer = null;
  }

  double _getRandomValue() {
    final random = math.Random();
    return random.nextDouble() * 100;
  }

  Future<void> fetchData() async{
    final apiKey = '51c2bf8d80a941b1a81173409232706';
    final response = await http.get(Uri.parse('http://api.weatherapi.com/v1/current.json?key=$apiKey&q=London&aqi=no'));
    if(response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final temperature = jsonData['current']['temp_c'].toDouble() + math.Random().nextDouble()*10;

      setState(() {
        data.add(ChartData(DateTime.now(), temperature));
        if(data.length > 50){
          data.removeAt(0);
        }
      });
    } else {
      print('Fetch has failed');
    }
  }

  @override
  Widget build(BuildContext context){
    return  SfCartesianChart(
          primaryXAxis: DateTimeAxis(),
          plotAreaBackgroundColor: Colors.black,
          series: <LineSeries<ChartData, DateTime>>[
            LineSeries<ChartData,DateTime>(
              dataSource: data,
              xValueMapper: (ChartData data, _) => data.time, 
              yValueMapper: (ChartData data, _) => data.value,
              color: Colors.yellow,
            )
          ]
        );
      
    
  }
}

class ChartData {
  final DateTime time;
  final double value;

  ChartData(this.time, this.value);
}