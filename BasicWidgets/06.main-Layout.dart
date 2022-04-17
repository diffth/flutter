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
      // body: ElevatedButton(child: const Text('Button'), onPressed: () {
        
      // },),
      body: Column(
        children: [
          Container(
            color: Colors.yellow,
            width: 280,
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                ElevatedButton(child: const Text('Button'), onPressed: () { },),
                // SizedBox(width: 10,),
                // Spacer(flex: 1,),
                ElevatedButton(child: const Text('Button'), onPressed: () { },),
                // SizedBox(width: 10,),
                // Spacer(flex: 1,),
                ElevatedButton(child: const Text('Button'), onPressed: () { },),
                // SizedBox(width: 10,),
            ],),
          ),
          Container(
            color: Colors.cyan,
            width: 280,
            height: 100,
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: [
                ElevatedButton(child: const Text('Button'), onPressed: () { },),
                // SizedBox(width: 10,),
                // Spacer(flex: 1,),
                ElevatedButton(child: const Text('Button'), onPressed: () { },),
                // SizedBox(width: 10,),
                // Spacer(flex: 1,),
                ElevatedButton(child: const Text('Button'), onPressed: () { },),
                // SizedBox(width: 10,),
            ],),
          ),
        ],
      ),
    );
  }
}

