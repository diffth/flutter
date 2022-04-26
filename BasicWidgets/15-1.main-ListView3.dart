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
      body: ListView.separated(
        itemCount: persons.length,
        itemBuilder: (BuildContext context, int index){
          return PersonTile(persons[index], index);
        },
        separatorBuilder: (BuildContext context, int index){
          return const Divider(
            color: Colors.black,
            // color: Colors.transparent,
            height: 1,
            // thickness: 1.0,
          );
        },
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
    return ListTile(
      leading: Icon(Icons.person),
      title: Text(_person.name),
      subtitle: Text("${_person.age} 세"),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: (){
        print("${_person.name} : $index");
      },
    );
  }
}
