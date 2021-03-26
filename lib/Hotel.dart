import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class Hotel{
  String Nombre;
  int Stars;
  String Link;
  String Descripcion;
  int price;

  Hotel( { this.Nombre, this.Stars, this.Link, this.Descripcion, this.price  } );
  void ReadData(int num,int pos) async {
    print("hotel $pos");
    String pth='assets/${num}_hotel_${pos}_nombre.txt';
    final texto =  await rootBundle.loadString(pth);
    print( "text = $texto ");
    Nombre=texto;
    print(texto);

  }
  void ReadName(int num,int pos) async {


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