import 'package:flutter/material.dart';
import 'Hotel.dart';
import 'dart:ui';
import 'package:url_launcher/url_launcher.dart';

class VizorHotel extends StatefulWidget {
  @override
  _VizorHotelState createState() => _VizorHotelState();
}

class _VizorHotelState extends State<VizorHotel> {
  bool Ban=false;
  Hotel Yo;
  double betw=15;
  List<Icon> stars=[];
  //double tama=15;

  @override
  Widget build(BuildContext context) {
    if( Ban==false ){
      //recibir yo
      dynamic cosas = ModalRoute.of(context).settings.arguments;
      Yo=cosas['Yo'];
      Ban=true;


      for(int i=1;i<=5;i++){
        if(  i<= Yo.Stars )
          stars.add(
              new Icon(
            Icons.star,
            color: Colors.yellowAccent,
            size: 30,
          )
          );
        else
          stars.add(
              new Icon(
          Icons.star_border_outlined,
          color: Colors.yellowAccent,
          size: 30,
          )
           );

      }
    }
    return Scaffold(
      appBar: AppBar(
          backgroundColor:  Color.fromRGBO( 164, 67,86 ,1),
          centerTitle: true,
          title: Text(
            'Holel #${Yo.Pos}',
            style: TextStyle(

                fontSize: 40,
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
              image: AssetImage( 'fotos/${Yo.Mun}_hotel_${Yo.Pos}_foto.png' ),
              // height: 100,
              //width: 100,
            ),
            SizedBox( height: betw, width: betw, ),
            ///stars
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: stars,
            ),
            SizedBox( height: betw, width: betw, ),
           ///precio por nocheee
            Text(
              'Precio por noche',
              style: TextStyle(
                fontSize: 25,
                fontFamily: 'Adventure 400',
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox( height: betw, width: betw, ),
            Text(
             "${Yo.Price} pesos.",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                //fontFamily: 'Adventure 400',
              ),
              textAlign: TextAlign.center,
            ),

            SizedBox( height: betw, width: betw, ),
            ///sitio web
            Text(
              'Sitio Web',
              style: TextStyle(
                fontSize: 25,
                fontFamily: 'Adventure 400',
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox( height: betw, width: betw, ),
            IconButton(
              icon: Icon(
                Icons.web,
                color: Colors.blue,
                size: 30,
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
