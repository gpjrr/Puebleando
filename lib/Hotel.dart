import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class Hotel{
  String Nombre;
  int Stars;
  String Link;
  String Descripcion;
  int Price;
  /// datos extra
  int Mun,Pos;

  Hotel( { this.Nombre, this.Stars, this.Link, this.Descripcion, this.Price  } );
  void ReadData(int num,int pos) async {
    print("holel #$pos");
    Mun=num; Pos=pos;
    await ReadName();
    await ReadStars();
    await ReadLink();
    await ReadDescripcion();
    await ReadPrice();
  }

  void ReadName() async {
    String pth='assets/${Mun}_hotel_${Pos}_nombre.txt';
    final texto =  await rootBundle.loadString(pth);
    print( "name = $texto ");
    Nombre=texto;
    print(texto);
  }
  void ReadStars() async{
    String pth='assets/${Mun}_hotel_${Pos}_stars.txt';
    final texto =  await rootBundle.loadString(pth);
    print( "stars = $texto ");
    Stars=int.parse(texto);
    print(texto);
  }
  void ReadLink() async{
    String pth='assets/${Mun}_hotel_${Pos}_link.txt';
    final texto =  await rootBundle.loadString(pth);
    print( "link = $texto ");
    Link=texto;
    print(texto);
  }
  void ReadDescripcion() async{
    String pth='assets/${Mun}_hotel_${Pos}_descripcion.txt';
    final texto =  await rootBundle.loadString(pth);
    print( "descripcion = $texto ");
    Descripcion=texto;
    print(texto);
  }
  void ReadPrice() async{
    String pth='assets/${Mun}_hotel_${Pos}_precio.txt';
    final texto =  await rootBundle.loadString(pth);
    print( "precio = $texto ");
    Price=int.parse( texto );
    print(texto);
  }

  //Hotel( { this.Nombre, this.Stars, this.Link, this.Descripcion, this.Price  } );
  String Imprimir(){
    String cad;
    cad="";
    cad=" nombre"+ Nombre +"\n" ;
    cad=" Stars"+ " $Stars "  +"\n" ;
    cad="Link"+ Link +"\n";
    cad=" descripcion "+ Descripcion +"\n";
    cad="precio"+ " $Price "+"\n";
    return cad;
  }

}

/*
 class hotel(){
	String nombre;
	int stars;
	String link;
	int precio;
	////foto
}

* */