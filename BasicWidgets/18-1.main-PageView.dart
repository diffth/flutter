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
      home: const MyHomePage(title: 'Flutter PageView'),
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
  final _pageController = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '터치후 좌우로 Swipe~',
              style: TextStyle(fontSize: 24.0),
            ),
            Expanded(
              flex: 1,
              child: PageView(
                controller: _pageController,
                children: [
                  page1(),
                  page2(),
                  page3(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget page1() {
    return Container(
      height: 200,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.camera_alt,
              color: Colors.red,
              size: 50.0,
            ),
            Text('Page index : 0', style: TextStyle(fontSize: 20),),
          ],
        ),
      ),
    );
  }
  Widget page2() {
    return Container(
      height: 200,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.add_circle,
              color: Colors.red,
              size: 50.0,
            ),
            Text('Page index : 1', style: TextStyle(fontSize: 20),),
          ],
        ),
      ),
    );
  }
  Widget page3() {
    return Container(
      height: 200,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.notifications,
              color: Colors.red,
              size: 50.0,
            ),
            Text('Page index : 2', style: TextStyle(fontSize: 20),),
          ],
        ),
      ),
    );
  }
}
