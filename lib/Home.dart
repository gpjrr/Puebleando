import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.redAccent,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        //shadowColor: Colors.redAccent,
        centerTitle: true,
          title: Text(
          "Pueblando",
          style: TextStyle(
              fontSize: 20,
          ),

        )
      ),
      drawer: SafeArea(
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
              Divider(),
              ListTile(
                title: Text(
                  'Tips',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    letterSpacing: 1,
                    fontFamily: 'Redressed-Regular',
                  ),
                ),
                trailing: Icon(
                  Icons.lightbulb_outline,
                  color: Colors.yellow,
                ),
              ),
              Divider(),

            ],

          ),

        ),
      ),
      body: ListView(
        //crossAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Bienvenid@",
            style: TextStyle(
              fontSize: 40,

            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
