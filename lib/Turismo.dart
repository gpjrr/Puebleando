import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
class Turismo{
  int Tipo;
  String Nombre;
  String Link;
  String Descripcion;
  /// datos ctra
  int Mun,Pos;
  Turismo( { this.Tipo, this.Nombre, this.Link, this.Descripcion } );
  void ReadData(int num,int pos) async {
    Mun=num;
    Pos=pos;
    print("turismo #$Pos");
    await ReadTipo();
    await ReadNombre();
    await ReadLink();
    await ReadDescripcion();
  }
  void ReadTipo() async{
    String pth='assets/${Mun}_turismo_${Pos}_tipo.txt';
    final texto =  await rootBundle.loadString(pth);
    print( "tipo = $texto");
    Tipo=int.parse( texto );
    print(texto);
  }
  void ReadNombre() async{
    String pth='assets/${Mun}_turismo_${Pos}_nombre.txt';
    final texto =  await rootBundle.loadString(pth);
    print( "name = $texto ");
    Nombre=texto;
    print(texto);

  }
  void ReadLink() async{
    String pth='assets/${Mun}_turismo_${Pos}_link.txt';
    final texto =  await rootBundle.loadString(pth);
    print( "link = $texto ");
    Link=texto;
    print(texto);
  }
  void ReadDescripcion() async{
    String pth='assets/${Mun}_turismo_${Pos}_descripcion.txt';
    final texto =  await rootBundle.loadString(pth);
    print( "descripcion = $texto ");
    Descripcion=texto;
    print(texto);
  }
//Turismo( { this.Tipo, this.Nombre, this.Link, this.Descripcion } );
  String Imprimir(){
    String cad="";
    cad+="tipo "+" $Tipo " +"\n";
    cad+="Nombre "+ Nombre  +" \n";
    cad+="Link "+  Link +"\n";
    cad+="Descripcion "+ Descripcion +"\n";
    return cad;
  }

}