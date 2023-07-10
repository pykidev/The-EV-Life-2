import 'package:flutter/material.dart';
import 'package:the_ev_life/pages/home.dart';
// import 'package:the_ev_life/custom_widgets/charts.dart';
// import 'package:the_ev_life/custom_widgets/custom_forms.dart';
import 'package:the_ev_life/pages/pro_analytics.dart';

void main() {
  runApp(MaterialApp(
    home: SafeArea(child: Home())
  ));
}