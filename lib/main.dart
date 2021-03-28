import 'package:flutter/material.dart';
import 'Home.dart';
import 'Loading.dart';
void main() => runApp( MaterialApp(

    initialRoute: '/',
    routes:{
      '/': (context) => Loading(),
      '/home': (context) => Home(),
    }
/*
[164,67,86] rojo
[255,204,153] amarillo
[136,183,167] verde
[45,188,222] azul claro
[58,81,99] azul oscuro
[255,108,41] Naranja
 */

));