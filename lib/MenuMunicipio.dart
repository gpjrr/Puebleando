import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuMunicipio extends StatefulWidget {
  @override
  _MenuMunicipioState createState() => _MenuMunicipioState();
}

class _MenuMunicipioState extends State<MenuMunicipio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Retaurantes,'
        ),
        backgroundColor: Colors.amber,

      ),
      body: SafeArea(
        child: SizedBox(),
      ),
    );
  }
}
