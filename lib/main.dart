import 'package:flutter/material.dart';
import 'package:weatherapp02/Activity/home.dart';
import 'package:weatherapp02/Activity/loading.dart';
import 'package:weatherapp02/Activity/location.dart';

void main() {
  runApp(MaterialApp(
    routes: {
      "/" : (context) => Loading(),
      "/home" : (context) => Home(),
      "/loading" : (context) => Loading()
    },
    debugShowCheckedModeBanner: false,
  ));
}

