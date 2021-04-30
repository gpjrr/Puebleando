import 'package:flutter/material.dart';
import 'Home.dart';
import 'Loading.dart';
import 'MenuMunicipio.dart';
import 'VizorMunicipio.dart';
import 'VizorOpciones.dart';
import 'VizorRestaurantes.dart';
import 'VizorHotel.dart';
import 'VizorTurismo.dart';
void main() => runApp( MaterialApp(

    initialRoute: '/',
    routes:{
      '/' : (context) => Loading(),
      '/home' : (context) => Home(),
      '/menumunicipio' : (context) => MenuMunicipio(),
      '/vizormunicipio' : (context) => VizorMunicipio(),
      '/vizoropciones' : (context) => VizorOpciones(),
      '/vizorrestaurante': (context) => VizorRestaurantes(),
          '/vizorhotel':(context)=> VizorHotel(),
      '/vizorturismo': (context)=> VizorTurismo(),


      //visorunicipio
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