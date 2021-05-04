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
  List<String> Pictures=[];
  @override
  Widget build(BuildContext context) {
    if( Ban==false ){
      //recibir yo
      dynamic cosas = ModalRoute.of(context).settings.arguments;
      Yo=cosas['Yo'];
      print("namo==="+Yo.Nombre);
      Ban=true;
      print("pos====${Yo.Pos}");
      for(int i=1;i<=5;i++)
        Pictures.add( 'fotos/${Yo.Pos}_foto_${i}.png' );
    }
    return Scaffold(
      appBar: AppBar(
          backgroundColor:  Color.fromRGBO( 164, 67,86 ,1),
          centerTitle: true,
          title: Text(
            "Municipio #${Yo.Pos}",
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
            Text(
              Yo.Nombre,
              style: TextStyle(
                  fontSize: 40,
                  fontFamily: 'Redressed-Regular'
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox( height: betw, width: betw, ),
            Text(
              'Descripcion',
              style: TextStyle(
                fontSize: 25,
                fontFamily: 'Adventure 400',
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox( height: betw, width: betw, ),

            Container(
              margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
              child: Text(
                Yo.Descripcion,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  //fontFamily: 'Adventure 400',
                ),
              ),
            ),
            SizedBox( height: betw, width: betw, ),
            Text(
              'Fotos',
              style: TextStyle(
                fontSize: 25,
                fontFamily: 'Adventure 400',
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

            SizedBox( height: betw, width: betw, ),
            Text(
              'Clima',
              style: TextStyle(
                fontSize: 25,
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
                  onPressed: () async{
                    await Navigator.pushNamed(context,'/vizoropciones',arguments: {  'arr':Yo.Comida, 'titulo':'Restaurantes', 'tipo':1 });
                  },
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
                  onPressed: () async{
                    await Navigator.pushNamed(context,'/vizoropciones',arguments: {  'arr':Yo.Hoteles, 'titulo':'Hoteles', 'tipo':2 });
                  },
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
                  onPressed: () async{
                    await Navigator.pushNamed(context,'/vizoropciones',arguments: {  'arr':Yo.Atraccion, 'titulo':'Atracciones','tipo':3 });
                  },
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
            ),
            SizedBox( height: betw, width: betw, ),
            SizedBox( height: betw, width: betw, ),
          ],
        ),
      ),
    );
  }
}
