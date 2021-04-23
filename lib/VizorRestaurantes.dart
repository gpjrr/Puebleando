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
  double betw=15;
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
            Yo.Nombre,
            style: TextStyle(

                fontSize: 20,
                fontFamily: 'Redressed-Regular'
            ),

          )
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
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

          ],
        ),
      ),

    );

  }
}
