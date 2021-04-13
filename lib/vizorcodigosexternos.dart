/*

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  List<Task> Tareas = new List();
  List<Meta> Metas = new List();
  List< WeekView > Week= new List();
  int TabIndex = 0;
  UserData Yo;
  List<int> colores= [0,2,-1,0,1,3,2];
  //List<Icon> iconos=new List();
  bool ban = false;

  TabController _tabController;
  @override
  void initState() {
    //_tabController.addListener(() { activo=_tabController.index; });
    super.initState();
    _tabController = TabController(length: 2, vsync: this );

    _tabController.addListener(() {
      setState(() {
        TabIndex = _tabController.index;
      });
      print("Selected Index: " + _tabController.index.toString());
    });
  }
  void ReadUser()async {
    try{
      final direc = await getApplicationDocumentsDirectory();
      File doc = File('${direc.path}/SaveUser.json');
      dynamic tem=json.decode(await doc.readAsString());
      print("tem=$tem");
      Yo=UserData().from(tem);
      print('nombreeeee=${Yo.NombreU}');
    }
    catch(e){
      print('usuario error $e');
    }

  }
  void WriteMeta() async {
    try {} catch (e) {
      print('No grabo meta por $e ');
    }
  }
  void WriteUser()async{

    try {
      final direc = await getApplicationDocumentsDirectory();
      File archivo = File('${direc.path}/SaveUser.json');
      String jText = jsonEncode(Yo);
      print('esto es el yo=$jText');
      await archivo.writeAsString(jText);
    } catch (e) {
      print('no jaloo por ${e}');
    }


  }
  void WriteTask() async {
    try {
      print('p1 write task\n');
      final direc = await getApplicationDocumentsDirectory();
      print('p2 write task \n');
      File archivo = File('${direc.path}/SaveTasks.json');
      print('p3 writetask ${ Tareas[0].toJson() } \n');

      String jText = jsonEncode(Tareas);
      print('p4 write task\n');
      print('cambio= ${jText} \n');
      await archivo.writeAsString(jText);
    } catch (e) {
      print('no jaloo por ${e}');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (ban == false) {
      print("dia del ano= ${Jiffy().dayOfYear}");
      dynamic cosas = ModalRoute.of(context).settings.arguments;

      Tareas = cosas['Tareas'];
      Metas = cosas['Metas'];
      Yo=cosas['Yo'];
      print('tareaaa=${Tareas.length}');
      print('yo=${Yo.TaskCont}');
      Yo.DaysWeek();
      // print('yoDias=${Yo.WeekDay }');
      int HOY=Jiffy().dayOfYear;

      print('hoyDias=${ Jiffy().dayOfYear }');
      for(var cosa in Tareas)
        print("..${ cosa.WDay }");


      ban = true;
      for (int i = 0; i < Tareas.length; i++) {
        Tareas[i].RelojIcono();
        Tareas[i].Lave = UniqueKey();
        //print( ' nor=${Tareas[i].Lave} rara=${ UniqueKey() } ' );


        Tareas[i].Crayola=new List.filled(7, 0);
        for(int j=0;j<7;j++)
          if( Tareas[i].Dias[j]==true ) {
            Tareas[i].Crayola[j] = 1;
            int tem=Yo.WeekDay[ j ];
            print("yo=$tem i=$i j=$j val=${Tareas[i].WDay[ tem ]}");
            if( Tareas[i].WDay[ tem ]!=0 )
              Tareas[i].Crayola[j]=Tareas[i].WDay[ tem ];
          }
        Week.add( new WeekView( valores: Tareas[i].Crayola ) );
      }

    }

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Color.fromRGBO(211, 211, 211, 1),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true,
          title: Text(
            'Hola ${Yo.NombreU}',
            //'Hola ${Yo.NombreU} ${Yo.TaskCont}',
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
              letterSpacing: 1,
              fontFamily: 'Bellota-BoldItalic',
            ),
          ),
          actions: <Widget>[
            /*Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {},
                  child: Icon(
                    Icons.search,
                    size: 26.0,
                  ),
                )
            ),*/
            Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: PopupMenuButton(
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: 1,
                    child: Text("Editar Nombre",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        letterSpacing: 1,
                        fontFamily: 'Bellota-BoldItalic',
                      ),
                    ),
                  ),
                  PopupMenuItem(
                    value: 2,
                    child: Text("Salir",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        letterSpacing: 1,
                        fontFamily: 'Bellota-BoldItalic',
                      ),
                    ),
                  ),
                ],
                onSelected: (value) {
                  print("value:$value");
                  if( value==2 )
                    exit(0);
                  else {
                    setState(() async{
                      dynamic cosa2 = await Navigator.pushNamed(context,'/FirstView');
                      String Nambre=cosa2['Nombre'];
                      Yo.NombreU=Nambre;
                      WriteUser();
                    });


                  }
                },
              ),
            ),
          ],
          backgroundColor: Colors.yellow[500],
          bottom: TabBar(
            controller: _tabController,
            onTap: (index) {
              //  print("val==${index}");
              ///              TabIndex = index;
            },
            tabs: <Widget>[
              Tab(
                child: Text(
                  'Tareas',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    letterSpacing: 1,
                    fontFamily: 'Bellota-BoldItalic',
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Metas',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    letterSpacing: 1,
                    fontFamily: 'Bellota-BoldItalic',
                  ),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            SafeArea(
              child: ListView.builder(
                itemCount: Tareas.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 2,
                        horizontal: 2,
                      ),
                      child: Card(
                        //borderOnForeground: true,
                        child: ListTile(
                          onTap: () async {
                            dynamic cosa2 = await Navigator.pushNamed(
                                context, '/editor',
                                arguments: {
                                  'Nombre': Tareas[index].Nombre,
                                  'Descripcion': Tareas[index].Descripcion,
                                  'Dias': Tareas[index].Dias,
                                  'Tempo': Tareas[index].Tempo,
                                  'Hora': Tareas[index].Hora,
                                  'Minu': Tareas[index].Minu,
                                  'Today': Tareas[index].Today
                                });
                            //print(cosa2);
                            setState(() {
                              Task Sujeto = Task(
                                Nombre: cosa2['Nombre'],
                                Limpio: true,
                                Descripcion: cosa2['Descripcion'],
                                Dias: cosa2['Dias'],
                                Tempo: cosa2['Tempo'],
                                Lave: UniqueKey(),
                                Today: cosa2['Today'],
                                Hora: cosa2['Hora'],
                                Minu: cosa2['Minu'],
                              );
                              Sujeto.RelojIcono();
                              Tareas[index] = Sujeto;
                              WriteTask();
                            });
                          },
                          //tileColor: Colors.blue,
                          //Yo.DailyTime[ Jiffy().dayOfYear ]
                          //trailing: Text('${  Tareas[index].WDay[ Jiffy().dayOfYear ] }'),
                          leading: Tareas[index].Reloj,
                          title: Text(
                            Tareas[index].Nombre.substring(
                                0,
                                Tareas[index].Nombre.length >= 18
                                    ? 18
                                    : Tareas[index].Nombre.length),
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              letterSpacing: 1,
                              fontFamily: 'EastSeaDokdo-Regular',
                              //fontFamily: 'Caveat-Regular',
                            ),
                          ),
                          //trailing: Tareas[index].Reloj,
                          subtitle:Week[index].Semana(),

                        ),
                      ),
                    ),
                    key: Tareas[index].Lave,
                    secondaryBackground: Container(
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Icon(
                          Icons.delete,
                          color: Colors.black,
                          size: 40,
                        ),
                      ),
                    ),
                    background: Container(
                      color: Colors.green,
                      alignment: Alignment.centerLeft,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Icon(
                          Icons.flag,
                          color: Colors.black,
                          size: 40,
                        ),
                      ),
                    ),
                    onDismissed: (direction) async {
                      Task tem = Tareas[index];
                      setState(() async{
                        print("tam== ${Tareas.length} I=$index");
                        //print("${Tareas[index].Tempo}");
                        print("${Tareas[index].Hora} ${Tareas[index].Minu}");
                        Tareas.removeAt(index);
                        if (direction == DismissDirection.startToEnd) {
                          try {
                            await Navigator.pushNamed(
                                context, '/tiempo',
                                arguments: {
                                  'Hora': tem.Hora,
                                  'Minu': tem.Minu,
                                  'ID':tem.ID,
                                });
                            /*
                            /// condicionar que finalice el trabajo
                            //print("size=${Yo.WeekDay.length} day=${Jiffy().dayOfYear}");
                            //Yo.DailyTime[ Jiffy().dayOfYear  ]+=work;
                            */
                            await ReadUser();
                            print("aqui vuelvee");


                          } catch (e) {
                            print('no jalo el slide por $e');
                          }
                        }
                        else {
                          await WriteTask();
                        }

                      });

                      /// aqui borramos la tarea peroo creo no requiere
                    },
                  );
                },
              ),
            ),
            SafeArea(
                child: ListView.builder(
                    itemCount: Metas.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 2,
                          horizontal: 2,
                        ),
                        child: Card(
                          child: ListTile(
                              onTap: () async {
                                dynamic cosam = await Navigator.pushNamed(
                                    context, '/editormeta',
                                    arguments: {
                                      'Name': Metas[index].Name,
                                      'Days': Metas[index].Days,
                                      //'Why':Metas[index].Why,
                                      //'StepN':Metas[index].StepN,
                                      'StepD': Metas[index].StepD,
                                    });
                                setState(() {
                                  Meta Sujeto = Meta(
                                    Name: cosam['Name'],
                                    Days: cosam['Days'],
                                    // StepN: cosam['StepN'],
                                    StepD: cosam['StepD'],
                                  );
                                  Metas[index] = Sujeto;
                                });
                              },
                              title: Text(
                                Metas[index].Name,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  letterSpacing: 1,
                                  fontFamily: 'EastSeaDokdo-Regular',
                                  //fontFamily: 'Caveat-Regular',
                                ),
                              )),
                        ),
                      );
                    }))
          ],
        ),


        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            dynamic cosa;

            /// tabindex==0 tareas en 1 metas
            if (TabIndex == 0) {
              Task Nuevo = Task(
                Nombre: '',
                Descripcion: "",
                Limpio: true,
                Hora: "00",
                Minu: "00",
                Dias: List.filled(7, false),
                Lave: UniqueKey(),
                Tempo: false,
                Today: true,
                ID: Yo.TaskCont,
                WDay: new List.filled(400, 0),
              );
              print("=-=${Nuevo.WDay}");
              Nuevo.Hoy();
              cosa = await Navigator.pushNamed(context, '/editor', arguments: {
                'Nombre': Nuevo.Nombre,
                'Descripcion': Nuevo.Descripcion,
                'Dias': Nuevo.Dias,
                'Tempo': Nuevo.Tempo,
                'Hora': Nuevo.Hora,
                'Minu': Nuevo.Minu,
                'Today': Nuevo.Today,
                'ID':Nuevo.ID,
                'WDay':Nuevo.WDay,
              });
              print('cosa wday=${ cosa['WDay'] }');
            }
            else {
              Meta Nuevo = new Meta(
                Name: '',
                Days: 0,
                StepD: new List(10),
                Why: '',
                //StepN: 0,
              );
              cosa = await Navigator.pushNamed(context, '/editormeta', arguments: {
                'Name': Nuevo.Name,
                'Days': Nuevo.Days,
                'Why': Nuevo.Why,
                'StepD': Nuevo.StepD,
                //'Progress':Nuevo.Progress, no mandas progreso,
                ///el progreso se calcula y si se regresa
                //'StepN':Nuevo.StepN,
              });
            }

            setState(() {
              /*print('cosa1 wday= ${ cosa['WDay'] }');
              print(' indice=${TabIndex}');*/
              if (cosa != null) {
                if (TabIndex == 0) {
                  //print('cosa wday= ${ cosa['WDay'] }');
                  Task Sujeto = Task(
                    Nombre: cosa['Nombre'],
                    Limpio: true,
                    Descripcion: cosa['Descripcion'],
                    Dias: cosa['Dias'],
                    Tempo: cosa['Tempo'],
                    Lave: UniqueKey(),
                    Today: cosa['Today'],
                    Hora: cosa['Hora'],
                    Minu: cosa['Minu'],
                    WDay:  cosa['WDay'],
                    //ID: cosa['ID'],
                  );

                  Sujeto.ID= Yo.TaskCont++;
                  Sujeto.RelojIcono();
                  Tareas.add(Sujeto);
                  print('voy a guardar\n');
                  //print('try ${Sujeto.WDay[13]}\n');
                  WriteTask();
                  print('guarde las tareas \n');
                  WriteUser();
                  Week.add(new WeekView( valores:colores ));
                } else {
                  /// guardamos lo. que regresa el editor de la meta
                }
              }
            });
          },
          backgroundColor: Colors.blue[700],
          child: Icon(
            Icons.add,
            color: Colors.black87,
          ),
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              Text(
                'Tiempo concentrado\n${Yo.DailyTime[Jiffy().dayOfYear]} minutos',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  letterSpacing: 1,
                  fontFamily: 'Bellota-BoldItalic',
                ),
                textAlign: TextAlign.center,
              ),
              ListTile(
                title: Text('Tips'),
                trailing: Icon(
                  Icons.lightbulb_outline,
                  color: Colors.yellow,
                ),
              ),
              Divider(),
              ListTile(
                title: Text('Records'),
                trailing: Icon(
                  Icons.book,
                  color: Colors.brown,
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new TipList()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
 */