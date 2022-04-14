import 'package:flutter/material.dart';
import 'dart:ui'; //ui lib import

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Image',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Image'),
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
  void getWindowSize(){
    // 앱 화면 논리적 크기
    print(MediaQuery.of(context).size);
    // 화면 배율
    print(MediaQuery.of(context).devicePixelRatio);
    // 앱 화면 실제 크기
    print(window.physicalSize);
  }

  @override
  Widget build(BuildContext context) {
    getWindowSize();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      // body: Image.asset('assets/images/300x300a.png',
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 기본 이미지 사용
          Image.asset('assets/images/300x300a.png'),
          Image.asset('assets/images/300x300b.png'),
          Image.asset('assets/images/300x300b.png', width: 150,),
          Image.asset('assets/images/300x300a.png', width: 100,),
        ],
      ),
    );
  }
}
