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
  List<String> pages = ['page1', 'page2', 'page3'];

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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: const Text('page 1', style: TextStyle(fontSize: 20),),
                  onPressed: () => onClick(0),
                ),
                SizedBox(width: 10,),
                ElevatedButton(
                  child: const Text('page 2', style: TextStyle(fontSize: 20),),
                  onPressed: () => onClick(1),
                ),
                SizedBox(width: 10,),
                ElevatedButton(
                  child: const Text('page 3', style: TextStyle(fontSize: 20),),
                  onPressed: () => onClick(2),
                ),
              ],
            ),
            Text(
              '터치후 좌우로 Swipe~',
              style: TextStyle(fontSize: 24.0),
            ),
            Expanded(
              flex: 1,
              child: PageView.builder(
                controller: _pageController,
                itemCount: pages.length,
                itemBuilder: (context, index){
                  return getPage(index);
                },
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

  void onClick(int index) {
    if(_pageController.hasClients){
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  Widget getPage(int index) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            getIcon(index),
            Text(pages[index], style: TextStyle(fontSize: 20),),
          ],
        ),
      ),
    );
  }

  Widget getIcon(int index) {
    if(index == 0){
      return Icon(
        Icons.camera_alt,
        color: Colors.red,
        size: 35.0,
      );
    }else if(index == 1){
      return Icon(
        Icons.add_circle,
        color: Colors.orange,
        size: 35.0,
      );
    }else{
      return Icon(
        Icons.star,
        color: Colors.indigo,
        size: 35.0,
      );
    }
  }
}
