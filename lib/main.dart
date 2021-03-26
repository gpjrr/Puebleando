import 'package:flutter/material.dart';
import 'Home.dart';
import 'Loading.dart';
void main() => runApp( MaterialApp(

    initialRoute: '/',
    routes:{
      '/': (context) => Loading(),
      '/home': (context) => Home(),
    }


));