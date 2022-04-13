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
    var myTextStyle1 = TextStyle(
      fontSize: 30.0,
      fontWeight: FontWeight.bold,
      height: 1.5,
      color: Colors.red.withOpacity(0.8),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      // 수직으로 나열할 때 Column
      body: Column(
        children: <Widget>[
          const Text(
            '01234567890Aa가#',
            style: TextStyle(
              fontSize: 30.0,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              color: Colors.orange,
              fontFamily: "D2Coding",
              letterSpacing: 4.0,
            ),
          ),
          const Text(
            '0123456789Aa가#',
            style: TextStyle(
              fontSize: 30.0,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
              color: Color(0xFF000000),
            ),
          ),
          Text(
            '0123456789Aa가#',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.w500,
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          Text(
            '0123456789Aa가#',
            textAlign: TextAlign.left,
            style: myTextStyle1,
          ),
        ],
      ),
    );
  }
}
