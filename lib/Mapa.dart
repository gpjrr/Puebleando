import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:photo_view/photo_view.dart';

class Mapa extends StatefulWidget {
  @override
  _MapaState createState() => _MapaState();
}

class _MapaState extends State<Mapa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //255,204,153 amarillo

        //[164,67,86] rojo
          backgroundColor: Color.fromRGBO( 164, 67,86 ,1),
          //shadowColor: Colors.redAccent,
          centerTitle: true,
          title: Text(
            "Mapa de Puebla",
            style: TextStyle(
                fontSize: 40,
                fontFamily: 'DancingScript-Regular'
            ),

          )
      ),
      body: SafeArea(
              child: PhotoView(
                imageProvider: AssetImage('fotos/mapatrans.png'),
              )
      ),


    );
  }
}
