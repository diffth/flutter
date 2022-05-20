import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter SQLite',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter SQLite'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<Database> database;

  @override
  void initState() {
    super.initState();
    database = getDB();
  }

  Future<Database> getDB() async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, 'mytest.db');
    var exists = await databaseExists(path);

    if(!exists){
      try{
        await Directory(dirname(path)).create(recursive: true);
      }catch(_){}

      var data = await rootBundle.load(join('assets/database', 'original.db'));
      List<int> bytes = data.buffer.asUint8List(
        data.offsetInBytes,
        data.lengthInBytes,
      );
      await File(path).writeAsBytes(bytes, flush: true);
    }
    return await openDatabase(path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: const Text('Select', style: TextStyle(fontSize: 24),),
              onPressed: () => doSelectAll(),
            ),
          ],
        ),
      ),
    );
  }

  void doSelectAll() async {
    final Database db = await database;

    List<Map> datas = await db.rawQuery('select * from family');
    if(datas.isNotEmpty){
      for(int i=0; i<datas.length; i++){
        String name = datas[i]['name'];
        int age = datas[i]['age'];
        String relation = datas[i]['relation'];

        print('$name $age $relation');
      }
    }else{
      print('SelectAll : No Data');
    }
  }

}
