import 'package:flutter/material.dart';
import 'package:puebleando/Municipio.dart';
import 'package:puebleando/Municipio.dart';
class VizorMunicipio extends StatefulWidget {
  @override
  _VizorMunicipioState createState() => _VizorMunicipioState();
}

class _VizorMunicipioState extends State<VizorMunicipio> {
  bool Ban=false;
  Municipio Yo=new Municipio(Nombre: 'sdf', Clima: "" );
  @override
  Widget build(BuildContext context) {
    if( Ban==false ){
      //recibir yo
      Ban=true;
    }
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color.fromRGBO( 164, 67,86 ,1),
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

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

          ],
        ),
      ),
    );
  }
}
