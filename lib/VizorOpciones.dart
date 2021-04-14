import 'package:flutter/material.dart';

class VizorOpciones extends StatefulWidget {
  @override
  _VizorOpcionesState createState() => _VizorOpcionesState();
}

class _VizorOpcionesState extends State<VizorOpciones> {
  bool Ban=false;
  List<dynamic> arr=[];
  String Titulo;
  @override
  Widget build(BuildContext context) {
    if( Ban==false ){
      //recibir yo
      dynamic cosas = ModalRoute.of(context).settings.arguments;
      arr=cosas['arr'];
      Titulo=cosas['titulo'];
      //print("namo==="+Yo.Nombre);
      Ban=true;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO( 164, 67,86 ,1),
        centerTitle: true,
        title: Text(
          Titulo,
          style: TextStyle(
          fontSize: 40,
          fontFamily: 'Redressed-Regular'
          ),
        ),
        actions: [
          IconButton(
              icon: Icon(
                  Icons.search
              ),
              onPressed: () {

              }
          ),
        ],
    ),
      body: SafeArea(
        //child: Li,
      ),

    );
  }
}
