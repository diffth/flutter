import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo'),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        // children: [
        //   ListTile(
        //     leading: FlutterLogo(
        //       size: 50.0,
        //     ),
        //     title: Text('Basic Widget #1'),
        //     subtitle: Text('서브 타이틀'),
        //     trailing: Icon(Icons.more_vert),
        //     onTap: () {
        //       print('Basic Widget #1');
        //     },
        //   ),
        // ],
        // children: getMyList1(),
        children: getMyList2(),
      ),
    );
  }

  List<Widget> getMyList1() {
    List<Widget> myList = [
      ListTile(
        leading: FlutterLogo(
          size: 50.0,
        ),
        title: Text('Basic Widget #1'),
        subtitle: Text('서브 타이틀'),
        trailing: Icon(Icons.more_vert),
        onTap: () {
          print('Basic Widget #1');
        },
      ),
      Divider(
        color: Colors.black,
        height: 5,
      ),
    ];
    return myList;
  }

  List<Widget> getMyList2(){
    List<Person> persons = [];
    for(int i=0; i<15; i++){
      persons.add(Person(i+21, '이순신$i', true));
    }
    List<Widget> myList = [];
    for(int i=0; i<persons.length; i++){
      Widget wg = ListTile(
        leading: FlutterLogo(
          size: 50.0,
        ),
        title: Text('Basic Widget #$i'),
        subtitle: Text('${persons[i].name} - ${persons[i].age}'),
        trailing: Icon(Icons.more_vert),
        onTap: () {
          print('Basic Widget #$i');
        },
      );
      myList.add(wg);
    }
    return myList;
  }
}

class Person{
  int age;
  String name;
  bool isLeftHand;

  Person(this.age, this.name, this.isLeftHand);
}
