import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:puebleando/Searcher.dart';

class VizorOpciones extends StatefulWidget {
  @override
  _VizorOpcionesState createState() => _VizorOpcionesState();
}

class _VizorOpcionesState extends State<VizorOpciones> {
  bool Ban=false;
  List<dynamic> arr=[];
  String Titulo;
  int Tipo;
  String PrefijoPicture;
  /// tipo 1=comida  2=hotel 3=atracciones
  @override
  Widget build(BuildContext context) {
    if( Ban==false ){
      //recibir yo
      dynamic cosas = ModalRoute.of(context).settings.arguments;
      arr=cosas['arr'];
      Titulo=cosas['titulo'];
      Tipo=cosas['tipo'];
      print("titulo="+Titulo);
      Ban=true;
      if( Tipo==1 )
        PrefijoPicture='${arr[0].Mun}_restaurante';
      else
      if( Tipo==2 )
        PrefijoPicture='${arr[0].Mun}_hotel';
      else
      if( Tipo==3 )
        PrefijoPicture='${arr[0].Mun}_turismo';
      print('cosaaaa raraaaaaa');
      print('${PrefijoPicture}_${0+1}_foto.png');
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
                showSearch(context: context, delegate: Searcher( arr ) );
              },
          ),
        ],
    ),
      body: SafeArea(
        child: ListView.builder(
            itemCount: arr.length,
            itemBuilder: (context,index){
              return Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 0.5),
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.all( Radius.circular(20) ),
                ),
                margin: EdgeInsets.all(10),
                child: ListTile(
                  //tileColor: Colors.grey,
                  title: Text(
                    arr[index].Nombre,
                    style:TextStyle(
                      fontSize: 20,
                      fontFamily: 'Adventure 400',

                    ),
                    //textAlign: TextAlign.center,
                  ),

                  leading: CircleAvatar(
                    backgroundImage: AssetImage('fotos/${PrefijoPicture}_${index+1}_foto.png'),
                  ),  /// primer foto del hotel maybe
                  onTap: ()async{
                    if( Tipo==1 )
                    await Navigator.pushNamed(context,'/vizorrestaurante',arguments: { 'Yo':arr[index] });
                    if( Tipo==2 )
                    await Navigator.pushNamed(context,'/vizorhotel',arguments: { 'Yo':arr[index] });
                    if( Tipo==3 )
                    await Navigator.pushNamed(context,'/vizorturismo',arguments: { 'Yo':arr[index] });
                  },
                ),
              );
            }
        ),
      ),

    );
  }
}
