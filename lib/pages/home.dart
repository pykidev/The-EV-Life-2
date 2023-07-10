import 'package:flutter/material.dart';
import 'package:the_ev_life/custom_widgets/data_card.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SingleChildScrollView(
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
            )
        );
  }
}