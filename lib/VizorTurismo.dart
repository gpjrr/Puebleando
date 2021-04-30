import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:url_launcher/url_launcher.dart';
import 'Turismo.dart';
class VizorTurismo extends StatefulWidget {
  @override
  _VizorTurismoState createState() => _VizorTurismoState();
}

class _VizorTurismoState extends State<VizorTurismo> {
  bool Ban=false;
  Turismo Yo;
  double betw=15;
  String Nomo;
  @override
  Widget build(BuildContext context) {
    if( Ban==false ){
      //recibir yo
      dynamic cosas = ModalRoute.of(context).settings.arguments;
      Yo=cosas['Yo'];
      Ban=true;
      switch(Yo.Tipo){
        case 1:
          Nomo="Atraccion Cultural";
          break;
        case 2:
          Nomo="Atraccion Natural";
          break;
        case 3:
          Nomo="Atraccion recreativa";
          break;
      };

    }

    return Scaffold(
      appBar: AppBar(
          backgroundColor:  Color.fromRGBO( 164, 67,86 ,1),
          centerTitle: true,
          title: Text(
            Nomo,
            style: TextStyle(

                fontSize: 25,
                fontFamily: 'Redressed-Regular'
            ),

          )
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Text(
              Yo.Nombre,
              style: TextStyle(
                  fontSize: 40,
                  fontFamily: 'Redressed-Regular'
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox( height: betw, width: betw, ),
            ///descripcion
            Text(
              'Descripcion:',
              style: TextStyle(
                fontSize: 25,
                fontFamily: 'Adventure 400',
              ),
              //textAlign: TextAlign.center,
            ),
            SizedBox( height: betw, width: betw, ),
            Text(
              Yo.Descripcion,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                //fontFamily: 'Adventure 400',
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox( height: betw, width: betw, ),
            Image(
              image: AssetImage( 'fotos/${Yo.Mun}_turismo_${Yo.Pos}_foto.png' ),
              // height: 100,
              //width: 100,
            ),
            SizedBox( height: betw, width: betw, ),

            ///sitio web
            Text(
              'Ubicacion',
              style: TextStyle(
                fontSize: 25,
                fontFamily: 'Adventure 400',
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox( height: betw, width: betw, ),
            IconButton(
              icon: Icon(
                Icons.location_on,
                color: Colors.red[500],
              ),
              tooltip: 'link de la ubicacion',
              onPressed: ()async{
                await launch(Yo.Link);
              },
            ),

            SizedBox( height: betw, width: betw, ),
            SizedBox( height: betw, width: betw, ),


          ],
        ),
      ),
    );
  }
}
