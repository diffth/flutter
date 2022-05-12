import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<String>.value(value: '이순신',),
        Provider<String>.value(value: '정약용',),
        Provider<int>.value(value: 20),
      ],
      child:MaterialApp(
        title: 'Flutter Provider',
        theme: ThemeData(
          primaryColor: Colors.blue,
        ),
        home: const Page1(),
      ),
    );
  }
}

class Page1 extends StatefulWidget {
  const Page1({ Key? key }) : super(key: key);

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  String data = '';
  int number = 0;

  @override
  Widget build(BuildContext context) {
    data = Provider.of<String>(context, listen: true);
    number = Provider.of<int>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 1'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('2Page Add', style: TextStyle(fontSize: 24),),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Page2(),),
                );
              },
            ),
            Text('$data - $number', style: const TextStyle(fontSize: 30),),
          ],
        ),
      ),
    );
  }
}

class Page2 extends StatefulWidget {
  const Page2({ Key? key }) : super(key: key);

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('2Page Remove', style: TextStyle(fontSize: 24),),
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Consumer2<String, int>(
              builder: (context, data1, data2, child) {
                return Text('$data1 - $data2', style: const TextStyle(fontSize: 30),);
              },
            ),
          ],
        ),
      ),
    );
  }
}
