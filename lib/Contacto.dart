import 'package:flutter/material.dart';
import 'dart:ui';

class Contacto extends StatefulWidget {
  @override
  _ContactoState createState() => _ContactoState();
}

class _ContactoState extends State<Contacto> {
  double betw=15;
  bool ban=false;
  List<String> Pictures=[];
  @override
  Widget build(BuildContext context) {
    if( ban==false ){
      for(int i=1;i<=5;i++)
        Pictures.add('fotos/con$i.jpg');
      ban=true;
    }
    return Scaffold(
      appBar: AppBar(
        //255,204,153 amarillo

        //[164,67,86] rojo
          backgroundColor: Color.fromRGBO( 164, 67,86 ,1),
          //shadowColor: Colors.redAccent,
          centerTitle: true,
          title: Text(
            "Contacto",
            style: TextStyle(
                fontSize: 40,
                fontFamily: 'DancingScript-Regular'
            ),

          )
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Text(
              "Equipo numero 8",
              style: TextStyle(
                  fontSize: 40,
                  fontFamily: 'Redressed-Regular'
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox( height: betw, width: betw, ),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 30.0),
              height: MediaQuery.of(context).size.height * 0.35,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: Pictures.length,
                  itemBuilder: (context,index){
                    return Container(
                      width: MediaQuery.of(context).size.width ,
                      child: Image(
                        image: AssetImage(Pictures[index]),
                        height: 70,
                        width: 70,
                      ),
                    );
                  }
              ),
            ),
            ///integrantes del equipo
            SizedBox( height: betw, width: betw, ),
            Text(
              'Integrantes del equipo',
              style: TextStyle(
                fontSize: 25,
                fontFamily: 'Adventure 400',
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox( height: betw, width: betw, ),

            Text(
              'Danna Sophia Huicochea Jimenez',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                //fontFamily: 'Adventure 400',
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox( height: betw, width: betw, ),
            Text(
              'Joel Alejandro Cordero Peña',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                //fontFamily: 'Adventure 400',
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox( height: betw, width: betw, ),
            Text(
              'Hazel Fernando Trujillo Chavez',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                //fontFamily: 'Adventure 400',
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox( height: betw, width: betw, ),
            Text(
              'Carlos Alberto Gastelum Zenteno',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                //fontFamily: 'Adventure 400',
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox( height: betw, width: betw, ),
            Text(
              'Erwin Romero Ramos',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                //fontFamily: 'Adventure 400',
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox( height: betw, width: betw, ),

            Text(
              'Gracias por usar nuestra App!',
              style: TextStyle(
                fontSize: 25,
                fontFamily: 'Adventure 400',
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox( height: betw, width: betw, ),
            Text(
              'En casos de dudas, errores o cualquier aclaracion puede contactarnos en nuestro correo:',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                //fontFamily: 'Adventure 400',
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox( height: betw, width: betw, ),
            Text(
              'Godzilla.contacto@hotmail.com',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                //fontFamily: 'Adventure 400',
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox( height: betw, width: betw, ),
            SizedBox( height: betw, width: betw, ),
            SizedBox( height: betw, width: betw, ),
          ],
        ),
      ),


    );
  }
}
