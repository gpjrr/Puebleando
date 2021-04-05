import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
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
              fontSize: 20,
              fontFamily: 'DancingScript-Regular'
          ),

        )
      ),
      drawer: SafeArea(
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
              Divider(),
              ListTile(
                title: Text(
                  'Tips',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    letterSpacing: 1,
                    fontFamily: 'Redressed-Regular',
                  ),
                ),
                trailing: Icon(
                  Icons.lightbulb_outline,

                  color: Colors.yellow,
                ),
              ),
              Divider(),

            ],

          ),

        ),
      ),
      body: ListView(
        //crossAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Bienvenido a Puebleandp",
            style: TextStyle(
              fontSize: 40,
              fontFamily: 'Adventure 400',
            ),
            textAlign: TextAlign.center,
          ),
          ///fotoo
          SizedBox(height: 30,width: 30,),
          Text(
            "Queremos que le des el mejor uso a esta app, para que encuentres los mejores luegares en Puebla,",
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'Adventure 400',
            ),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 100,vertical: 30),
            child: FlatButton(
              //color: Color.fromRGBO(255,108,41,1),
              onPressed: ()async{
                  ///navegar a municipios
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
          )
        ],
      ),
    );
  }
}
