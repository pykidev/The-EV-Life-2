import 'package:flutter/material.dart';
import 'package:the_ev_life/custom_widgets/charts.dart';

class ProAnalytics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text('Pro Analytics', style: TextStyle(fontSize: 20.0),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Card(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))
                ),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: const Text('Charge per km versus time'),
                    ),
                    Container(height: 16.0,),
                    Container(child: RealTimeChart(true)),
                  ],
                ),
              ),
            ),
            Container(height: 25.0,),
            Container(
              padding: EdgeInsets.all(16.0),
              margin: EdgeInsets.fromLTRB(0, 0, 0, 100),
              child: Card(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))
                ),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: const Text('Battery temperature versus time'),
                    ),
                    Container(height: 16.0,),
                    Container(child: RealTimeChart(false)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}