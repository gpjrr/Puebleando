import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:convert';
import 'package:flutter/gestures.dart';
import 'package:puebleando/Hotel.dart';
import 'package:puebleando/Restaurante.dart';
import 'package:puebleando/Turismo.dart';
import 'package:flutter/services.dart' show rootBundle;

class Municipio{
  ///data on txt
  String Clima;
  String Nombre;
  int tt;
  List<Hotel> Hoteles;
  List<Restaurante> Comida;
  List<Turismo> Atraccion;

  /// extra data
  int num; /// numero de municipio
  Municipio({ this.Clima,this.Nombre, this.tt,this.num, this.Hoteles,this.Comida,this.Atraccion});
  Future<String> _getDirPath() async {
    final _dir = await getApplicationDocumentsDirectory();
    return _dir.path;
  }
  void ReadEverything() async{
      await ReadName();
      await ReadClima();
      await ReadTotalTurismo();
      await ReadElementos();
  }
  void ReadName()  async {
    String pth='assets/${num}_nombre.txt';
    final texto =  await rootBundle.loadString(pth);
    print( "text = $texto ");
    Nombre=texto;
    print(texto);

  }
  void ReadClima() async{
    String pth='assets/${num}_clima.txt';
    final texto =  await rootBundle.loadString(pth);
    Clima=texto;
    print(texto);


  }
  void ReadTotalTurismo() async{
    String pth='assets/${num}_tt.txt';
    final texto =  await rootBundle.loadString(pth);
    tt=int.parse( texto );
    print("tt=$tt");
  }
  void ReadElementos() async{
    for(int i=1;i<=5;i++){
      Hotel copy=new Hotel( Nombre: "",Stars: 0,Link: "", );
      await copy.ReadData(num,i);
      Hoteles.add( copy );
    }
    for(int i=1;i<=tt;i++){
      Turismo copi=new Turismo( nombre: "",link: "");
      await copi.ReadData();
      Atraccion.add( copi );
    }
  }

}
/*
    final path = await _getDirPath();
    //File archivo = File('informacion/Municipio${num}/${num}_nombre.txt');
    final archivo = File('${path}/assets/pepe.txt');
    print( "archivo = $archivo ");
    final texto =  await archivo.readAsStringSync( encoding: utf8 );
    print( "text = $texto ");
    Nombre=texto;
    print(texto);
*/



/*

class municipio(){
	String Clima;
	String Nombre;
	int tt;
	Hotel arr[];
	Restaurantes arr[];
	Turismo arr[];
	///fotos
}





 */