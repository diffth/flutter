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
      home: const MyHomePage(title: 'Flutter GridView'),
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
      body: GridView.count(
        padding: const EdgeInsets.all(10),
        crossAxisSpacing: 10,
        mainAxisSpacing: 100,
        crossAxisCount: 3,
        children: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8),
            color: Colors.blue[100],
            child: const Text("1"),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8),
            color: Colors.blue[200],
            child: const Text("2"),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8),
            color: Colors.blue[300],
            child: const Text("3"),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8),
            color: Colors.blue[400],
            child: const Text("4"),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8),
            color: Colors.blue[500],
            child: const Text("5"),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8),
            color: Colors.blue[600],
            child: const Text("6"),
          ),
        ],
      ),
    );
  }
}
