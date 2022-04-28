import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter ListView'),
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
  late List<Person> persons;

  @override
  void initState() {
    super.initState();

    persons = [];
    for(int i=0; i<15; i++){
      persons.add(Person(i+21, '이순신$i', true));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        margin: EdgeInsets.all(0.0),
        padding: EdgeInsets.all(0.0),
        child: ListView(
          children: [
            Container(
              width: double.infinity,
              height: 200,
              alignment: Alignment.center,
              color: Colors.amber[700],
              child: Text('Entry A', style: TextStyle(fontSize: 30),),
            ),
            Container(
              width: double.infinity,
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.all(8),
                itemCount: persons.length,
                itemBuilder: (BuildContext context, int index){
                  return PersonTile(persons[index], index);
                }
              ),
            ),
            Container(
              width: double.infinity,
              height: 200,
              alignment: Alignment.center,
              color: Colors.amber[500],
              child: Text('Entry b', style: TextStyle(fontSize: 30),),
            ),
            Container(
              width: double.infinity,
              height: 200,
              alignment: Alignment.center,
              color: Colors.amber[300],
              child: Text('Entry c', style: TextStyle(fontSize: 30),),
            ),
            Container(
              width: double.infinity,
              height: 200,
              alignment: Alignment.center,
              color: Colors.amber[100],
              child: Text('Entry d', style: TextStyle(fontSize: 30),),
            ),
          ],
        ),
      ),
    );
  }
}

class Person{
  int age;
  String name;
  bool isLeftHand;

  Person(this.age, this.name, this.isLeftHand);

}
class PersonTile extends StatelessWidget{
  final Person _person;
  final int index;

  PersonTile(this._person, this.index);

  @override
  Widget build(BuildContext context){
    return Card(
      color: Colors.amber[100],
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.black, width: 1),
        borderRadius: BorderRadius.circular(0),
      ),
      child: InkWell(
        splashColor: Colors.blue,
        onTap: (){
          print('$index Tile Click~!');
        },
        child: SizedBox(
          width: 140,
          height: 200,
          child: Column(
            children: [
              Text(
                _person.name,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "'${_person.age}세'",
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.normal
                ),
              ),
              ElevatedButton(
                child: const Text('ElevatedButton', style: TextStyle(fontSize: 14),),
                onPressed: () => _onClick(index),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onClick(int index) {
    print('$index Click~!');
  }
}
