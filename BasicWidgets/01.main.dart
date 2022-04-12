import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// StatelessWidget // 상태를 가지지 않는 위젯
// 상태 변화를 감지하지 않기 때문에 화면을 구성할 때 최초 한번만 build() 함수를 호출
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
      // home: Scaffold(
      //   appBar: AppBar(
      //     title: const Text('stateful'),
      //   ),
      //   body: const Text(
      //     'BasicWidgets Body',
      //     style: TextStyle(fontSize: 30),
      //   ),
      // ),
    );
  }
}

// StatefulWidget 
// State 객체를 가지며, createState() 함수를 통해서 State 객체를 만든다.
// 이 객체는 변경이 가능하다는 특징을 지녔기 때문에 상태 변경에 대한 처리를 할 수 있다.
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String name = "세종대왕";

  void _incrementCounter(){
    setState(() {
      _counter++;
    });
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
            // 상수
            const Text(
              'You have pushed th ebutton this many times:'
            ),
            Text(
              '이름 : $name',
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              '세종대왕 $_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
