import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:puebleando/Municipio.dart';
class MenuMunicipio extends StatefulWidget {
  @override
  _MenuMunicipioState createState() => _MenuMunicipioState();
}

class _MenuMunicipioState extends State<MenuMunicipio> {
  List<Municipio> arr=[];
  bool ban=false;
  @override
  Widget build(BuildContext context) {
    if( ban==false ){
      dynamic cosas = ModalRoute.of(context).settings.arguments;
      arr=cosas['arr'];
      ban=true;
    }
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color.fromRGBO( 164, 67,86 ,1),
          centerTitle: true,
          title: Text(
            "Municipios",
            style: TextStyle(
                fontSize: 40,
                fontFamily: 'Redressed-Regular'
            ),
          ),

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
                    backgroundImage: AssetImage('fotos/${index+1}_icono.png'),
                  ),
                  onTap: ()async{
                    await Navigator.pushNamed(context,'/vizormunicipio',arguments: {  'Yo':arr[index] });
                  },
                ),
              );
            }
        ),
      ),
    );
  }
}
