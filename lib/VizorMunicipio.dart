import 'package:flutter/material.dart';
import 'package:puebleando/Municipio.dart';
import 'package:puebleando/Municipio.dart';
class VizorMunicipio extends StatefulWidget {
  @override
  _VizorMunicipioState createState() => _VizorMunicipioState();
}

class _VizorMunicipioState extends State<VizorMunicipio> {
  bool Ban=false;
  double betw=15;
  Municipio Yo=new Municipio(Nombre: 'sdf', Clima: "" );
  @override
  Widget build(BuildContext context) {
    if( Ban==false ){
      //recibir yo
      dynamic cosas = ModalRoute.of(context).settings.arguments;
      Yo=cosas['Yo'];
      print("namo==="+Yo.Nombre);
      Ban=true;
    }
    return Scaffold(
      appBar: AppBar(
          backgroundColor:  Color.fromRGBO( 164, 67,86 ,1),
          centerTitle: true,
          title: Text(
            Yo.Nombre,
            style: TextStyle(
                fontSize: 40,
                fontFamily: 'Redressed-Regular'
            ),

          )
      ),
      body: SafeArea(
        child: ListView(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: <Widget>[

            SizedBox( height: betw, width: betw, ),
            Text(
              'Clima',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Adventure 400',
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox( height: betw, width: betw, ),

            Container(
             margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
              child: Text(
                Yo.Clima,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  //fontFamily: 'Adventure 400',
                ),
              ),
            ),
            SizedBox( height: betw, width: betw, ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RawMaterialButton(
                  onPressed: () {},
                  elevation: 2.0,
                  fillColor: Colors.white,
                  child: Icon(
                    Icons.fastfood,
                    size: 35.0,
                    color: Colors.red,
                  ),
                  padding: EdgeInsets.all(15.0),
                  shape: CircleBorder(),
                ),
                RawMaterialButton(
                  onPressed: () {},
                  elevation: 2.0,
                  fillColor: Colors.white,
                  child: Icon(
                    Icons.hotel,
                    size: 35.0,
                    color: Color.fromRGBO(45,188,222,1),
                  ),
                  padding: EdgeInsets.all(15.0),
                  shape: CircleBorder(),
                ),
                RawMaterialButton(
                  onPressed: () {},
                  elevation: 2.0,
                  fillColor: Colors.white,
                  child: Icon(
                    Icons.public_rounded,
                    color: Colors.lightGreen,
                    size: 35.0,
                  ),
                  padding: EdgeInsets.all(15.0),
                  shape: CircleBorder(),
                )
              ],
            )

          ],
        ),
      ),
    );
  }
}
