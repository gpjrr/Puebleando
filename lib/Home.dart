import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:puebleando/Municipio.dart';
import 'dart:math';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Municipio> arr=[];
  bool ban=false;
  String Pictures=[];
  @override
  Widget build(BuildContext context) {
    if( ban==false ){
      ban=true;
      dynamic cosas = ModalRoute.of(context).settings.arguments;
      arr=cosas['arr'];

    }

    return Scaffold(
      //backgroundColor: Colors.redAccent,
      appBar: AppBar(
          //255,204,153 amarillo

          //[164,67,86] rojo
        backgroundColor: Color.fromRGBO( 164, 67,86 ,1),
        //shadowColor: Colors.redAccent,
        centerTitle: true,
          title: Text(
          "Pueblando",
          style: TextStyle(
              fontSize: 40,
              fontFamily: 'DancingScript-Regular'
          ),

        )
      ),

      drawer: SafeArea  (
        child: Drawer(
          child: ListView(
            children: [
              SizedBox(height: 20,width: 20),
              Text(
                  'Menu Principal',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    letterSpacing: 1,
                    fontFamily: 'Redressed-Regular',
                  ),
                  textAlign: TextAlign.center,
              ),
              SizedBox(height: 20,width: 20),
              Image(
                image: AssetImage('fotos/Logo.png'),
                height: 70,
                width: 70,
              ),
              SizedBox(height: 20,width: 20),
              ListTile(
                title: Text(
                  'Lista De Municipios',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    letterSpacing: 1,
                    fontFamily: 'Redressed-Regular',
                  ),
                ),
                trailing: Icon(
                  Icons.list_alt,
                  color: Colors.black,
                ),
                onTap: ()async {
                  Navigator.pop(context);
                  await Navigator.pushReplacementNamed(context, '/menumunicipio',arguments: {'arr':arr} );
                },
              ),
              Divider(),
              ListTile(
                title: Text(
                  'Mapa',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    letterSpacing: 1,
                    fontFamily: 'Redressed-Regular',
                  ),
                ),
                trailing: Icon(
                  Icons.map,
                  color: Colors.black,
                ),
                onTap: ()async{
                  Navigator.pop(context);
                  await Navigator.pushNamed(context, '/mapapuebla'  );
                },
              ),
              Divider(),
              ListTile(
                title: Text(
                  'Contacto',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    letterSpacing: 1,
                    fontFamily: 'Redressed-Regular',
                  ),
                ),
                trailing: Icon(
                  Icons.message,
                  color: Colors.black,
                ),
                onTap: ()async{
                  Navigator.pop(context);
                  await Navigator.pushNamed(context, '/contacto'  );
                },
              ),
              Divider(),
            ],

          ),

        ),
      ),
      backgroundColor: Color.fromRGBO(45,188,222,1),
      body: ListView(

        //crossAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Bienvenido a Puebleando",
            style: TextStyle(
              fontSize: 40,
              fontFamily: 'Adventure 400',
            ),
            textAlign: TextAlign.center,
          ),
          ///fotoo
          SizedBox(height: 30,width: 30,),
          Text(
            "Queremos brindarte está app, para que encuentres los mejores lugares en Puebla, y pases un tiempo muy bueno viajando a traves de Puebla",
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'Adventure 400',
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 30,width: 30,),

         /* Padding(
            padding: EdgeInsets.symmetric(horizontal: 100,vertical: 30),
            child: FlatButton(
              //color: Color.fromRGBO(255,108,41,1),
              onPressed: ()async{
                  ///navegar a municipios
                // enviar municipios
                await Navigator.pushNamed(context, '/menumunicipio'  );
              },
              child: Text(
                'Iniciar',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'Redressed-Regular',
                    letterSpacing: 2,
                    //[45,188,222] azul claro
                  backgroundColor: Color.fromRGBO(255, 188, 222, 1),
                  color: Colors.blue,
                ),
              ),
              color: Colors.red,
              shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
            ),
          )*/

        ],
      )
    );
  }
}
