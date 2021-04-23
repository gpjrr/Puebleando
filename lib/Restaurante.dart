import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
class Restaurante{
  String Nombre;
  String Link;
  String Comida;
  String Descripcion;
  Restaurante({ this.Nombre, this.Link, this.Comida}); //this.Descripcion });
  /// datos extra
  int Mun,Pos;

  void ReadData(int num,int pos) async {
    Mun=num;
    Pos=pos;
    print("restaurante #$Pos");
    await ReadNombre();
    await ReadLink();
    await ReadComida();
    //await ReadDescripcion();
  }
  void ReadNombre()async{
    String pth='assets/${Mun}_restaurante_${Pos}_nombre.txt';
    final texto =  await rootBundle.loadString(pth);
    print( "name = $texto ");
    Nombre=texto;
    print(texto);
  }
  void ReadLink() async{
    String pth='assets/${Mun}_restaurante_${Pos}_link.txt';
    final texto =  await rootBundle.loadString(pth);
    print( "link = $texto ");
    Link=texto;
    print(texto);
  }
  void ReadComida() async{
    String pth='assets/${Mun}_restaurante_${Pos}_comida.txt';
    final texto =  await rootBundle.loadString(pth);
    print( "comida = $texto ");
    Comida=texto;
    print(texto);
  }
  /*
  void ReadDescripcion() async{
    String pth='assets/${Mun}_restaurante_${Pos}_descripcion.txt';
    final texto =  await rootBundle.loadString(pth);
    print( "descripcion = $texto ");
    Descripcion=texto;
    print(texto);
  }*/
  //Restaurante({ this.Nombre, this.Link, this.Comida,this.Descripcion });
  String Imprimir(){
    String cad;
    cad="";
    cad+="nombre "+ Nombre +"\n";
    cad+="Link "+ Link +"\n";
    cad+="Comida "+ Comida  +"\n";
   // cad+=" Decripcion "+ Descripcion +"\n";
    return cad;
  }
}