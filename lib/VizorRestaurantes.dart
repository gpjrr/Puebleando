import 'package:flutter/material.dart';
import 'Restaurante.dart';
import 'dart:ui';
import 'package:url_launcher/url_launcher.dart';
class VizorRestaurantes extends StatefulWidget {
  @override
  _VizorRestaurantesState createState() => _VizorRestaurantesState();
}

class _VizorRestaurantesState extends State<VizorRestaurantes> {
  Restaurante Yo;
  bool Ban=false;
  double betw=25;
  @override
  Widget build(BuildContext context) {
    if( Ban==false ){
      //recibir yo
      dynamic cosas = ModalRoute.of(context).settings.arguments;
      Yo=cosas['Yo'];
      Ban=true;
    }
    return  Scaffold(
      appBar: AppBar(
          backgroundColor:  Color.fromRGBO( 164, 67,86 ,1),
          centerTitle: true,
          title: Text(
            'Restaurante #${Yo.Pos}',
            style: TextStyle(
                fontSize: 40,
                fontFamily: 'Redressed-Regular'
            ),

          )
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            SizedBox( height: betw, width: betw, ),
            SizedBox( height: betw, width: betw, ),
              Text(
              Yo.Nombre,
              style: TextStyle(
                  fontSize: 40,
                  fontFamily: 'Redressed-Regular'
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox( height: betw, width: betw, ),
            Image(
              image: AssetImage( 'fotos/${Yo.Mun}_restaurante_${Yo.Pos}_foto.png' ),
             // height: 100,
              //width: 100,
            ),
            SizedBox( height: betw, width: betw, ),
            Text(
              'Tipo de Comida',
              style: TextStyle(
                fontSize: 25,
                fontFamily: 'Adventure 400',
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox( height: betw, width: betw, ),
            Text(
              Yo.Comida,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                //fontFamily: 'Adventure 400',
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox( height: betw, width: betw, ),
            FlatButton(
              child: Text(
                'Ubicacion',
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'Adventure 400',
                  color: Colors.blue,
                ),
              ),
              shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
              onPressed: ()async{
                await launch(Yo.Link);
              },
            ),

          ],
        ),
      ),

    );

  }
}
