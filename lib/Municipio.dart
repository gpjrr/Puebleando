import 'package:flutter/cupertino.dart';
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
  String Descripcion;
  int tt;
  List<Hotel> Hoteles=[];
  List<Restaurante> Comida=[];
  List<Turismo> Atraccion=[];

  /// extra data
  int Pos; /// numero de municipio
  Municipio({ this.Clima,this.Nombre, this.tt,this.Pos, this.Hoteles,this.Comida,this.Atraccion});
  Future<String> _getDirPath() async {
    final _dir = await getApplicationDocumentsDirectory();
    return _dir.path;
  }

  void ReadEverything() async{
      Hoteles=[];
      Comida=[];
      Atraccion=[];
      await ReadName();
      await ReadClima();
      await ReadDescripcion();
      await ReadTotalTurismo();
      await ReadElementos();
  }
  void ReadName()  async {
    String pth='assets/${Pos}_nombre.txt';
    final texto =  await rootBundle.loadString(pth);
    print( "text = $texto ");
    Nombre=texto;
    print(texto);

  }
  void ReadClima() async{
    String pth='assets/${Pos}_clima.txt';
    final texto =  await rootBundle.loadString(pth);
    Clima=texto;
    //print(texto);
  }

  void ReadDescripcion() async{
    String pth='assets/${Pos}_descripcion.txt';
    final texto =  await rootBundle.loadString(pth);
    Descripcion=texto;
    //print(texto);


  }

  void ReadTotalTurismo() async{
    String pth='assets/${Pos}_tt.txt';
    final texto =  await rootBundle.loadString(pth);
    tt=int.parse( texto );
    print("tt=$tt");
  }
  void ReadElementos() async{
    /// arreglar limites
    for(int i=1;i<=5;i++){
      Hotel copy=new Hotel( Nombre: "",Stars: 0,Link: "", );
      await copy.ReadData(Pos,i);
      //print("copy \n ${copy.Nombre} \n ${copy.Descripcion} \n ${copy.Stars} \n ${copy.Price}" );
      Hoteles.add( copy );
     // print("termino de leer el hotel #$i");
    }
    for(int i=1;i<=5;i++){
      Restaurante cop=new Restaurante(Nombre: "",Comida: "");
      await cop.ReadData(Pos,i);
      Comida.add( cop );
    }

    for(int i=1;i<=tt;i++){
      Turismo copi=new Turismo( Nombre: "",Link: "");
      await copi.ReadData(Pos,i);
      Atraccion.add( copi );
    }

  }



  ///Municipio({ this.Clima,this.Nombre, this.tt,this.Pos, this.Hoteles,this.Comida,this.Atraccion});
  String Imprimir() {
      String cad;
      cad="";
      cad+="clima"+ Clima +"\n";
      cad+="nombre"+ Nombre  +"\n";
      cad+="descripion"+Descripcion  +"\n";
      try{
        cad += "Hoteles" + Hoteles[0].Imprimir() + "\n";
        cad += "Comidas:" + Comida[0].Imprimir() + "\n";
        cad += "Turismo:" + Atraccion[0].Imprimir() + "\n";
      }
      catch(e){
        print("error por $e ");
      }

      return cad;
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