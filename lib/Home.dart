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
  List<String> Pictures=[];


  List shuffle(List items) {
    var random = new Random();

    // Go through all elements.
    for (var i = items.length - 1; i > 0; i--) {

      // Pick a pseudorandom number according to the list length
      var n = random.nextInt(i + 1);

      var temp = items[i];
      items[i] = items[n];
      items[n] = temp;
    }

    return items;
  }

  @override
  Widget build(BuildContext context) {
    if( ban==false ){
      ban=true;
      dynamic cosas = ModalRoute.of(context).settings.arguments;
      arr=cosas['arr'];
      for(int i=1;i<=6;i++ ){
        Pictures.add( 'fotos/${i}_foto_1.png' );
        Pictures.add( 'fotos/${i}_foto_2.png' );
        Pictures.add( 'fotos/${i}_foto_3.png' );
        Pictures.add( 'fotos/${i}_turismo_1_foto.png' );
      }
      Pictures=shuffle(Pictures);
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
          "Puebleando",
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
      //backgroundColor: Color.fromRGBO(45,188,222,1),
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
            "Hola bienvenido a Puebleando, una aplicación dedicada a los turistas que buscan tener una aventura mágica recorriendo los distintos pueblos mágicos de Puebla.",
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'Adventure 400',
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 30,width: 30,),
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
          SizedBox(height: 30,width: 30,),
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
