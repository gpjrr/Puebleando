import 'package:flutter/material.dart';
import 'package:puebleando/Municipio.dart';

class Searcher extends SearchDelegate{
  String SelectedResult;
  List<dynamic> arre;
  List<String> Pasado=[];
  Searcher(this.arre);
  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
          icon: Icon(
            Icons.close,
            color: Colors.red[500],
          ),
          onPressed: (){
            query='';
          }
      ),
    ];

  }
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(
              Icons.arrow_back,
        ),
        onPressed: (){
            Navigator.pop(context);
        },
    );
  }
  @override
  Widget buildResults(BuildContext context) {
    return Container(
      child: Text(
        "res=$SelectedResult",
        style:TextStyle(
          fontSize: 20,
          fontFamily: 'Adventure 400',

        ),
      ),
    );
  }
  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> tips =[];
    query.isEmpty?tips=Pasado:(){
      tips=[];
      print("tips se llenan");
      for( var yo in arre ){
        if(  yo.Nombre.Contains( query ) )
          tips.add( yo.Nombre );
      }
    };
    return ListView.builder(
        itemCount: tips.length,
        itemBuilder: (context, index ){
          return ListTile(
            title: Text(
              tips[index],
              style:TextStyle(
                fontSize: 20,
                fontFamily: 'Adventure 400',

              ),

            ),
            onTap: (){
              print("algo hace");
              SelectedResult=tips[index];
              showResults(context);
            },
          );
        }

    );

  }
}