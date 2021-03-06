  import 'package:flutter/material.dart';
  import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:puebleando/Municipio.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  List<Municipio> arr= new List();

  void ReadData() async{
    //arr=[];
    for(int i=1;i<=6;i++) {
      print("municipio num $i");
      Municipio nuevo=new Municipio( Nombre: "",Pos: i );
      await nuevo.ReadEverything();
      arr.add( nuevo );
      print( "num= ${arr[i-1].Pos} ");
    }

    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'arr':arr
    } );
  }

  @override
  void initState() {
    // TODO: implement initState~
    /// ??json
    super.initState();
    ReadData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child:  SpinKitFadingCircle(
          color: Colors.black,
          size: 50,
        ),
      ),
    );
  }
}
