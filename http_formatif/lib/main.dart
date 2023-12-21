import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'http/transfer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _name = "";
  TextEditingController taskName = TextEditingController();

  final dio = Dio();

  Truc truc = Truc();

  List<Truc> trucs = [];

  void _getInfo() async{
    try{
      var response = await Dio().get('https://4n6.azurewebsites.net/exam/representations/' + taskName.text.toString());
      print(response);

      var listeJSON = response.data as List;
      var listeTruc = listeJSON.map((elementJSON) {
        return Truc.fromJson(elementJSON);
      }).toList();
      trucs = listeTruc;
      setState(() {});
    }
    catch(e){
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('erreur'))
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              controller: taskName,
              onChanged: (value) {
                setState(() {
                  _name = value;
                });
              },
            ),
            ElevatedButton(
                onPressed: (){
              _getInfo();},
              child: Text('sss'),
            ),
            ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: trucs.length,
              itemBuilder: (context, index){
                return ListTile(
                  subtitle: Row(
                    children: [
                      Text(trucs[index].description + ": "),
                      Text(trucs[index].representation),
                    ],
                  ),
      
                );
              },
            )

          ],

        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
