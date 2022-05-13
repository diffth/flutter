import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}
class MyData extends ChangeNotifier{
  String name = '이순신';
  int age = 25;

  void change(String name, int age){
    print('change called...');
    this.name = name;
    this.age = age;

    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MyData>(
      create: (_) => MyData(),
      child: MaterialApp(
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
  late MyData myData;

  @override
  Widget build(BuildContext context) {
    myData = Provider.of<MyData>(context, listen: false);

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
            const SizedBox(height: 50,),
            ElevatedButton(
              child: const Text('임꺽정으로', style: TextStyle(fontSize: 24),),
              style: ElevatedButton.styleFrom(
                primary: Colors.greenAccent,
              ),
              onPressed: () {
                myData.change('임꺽정1', 30);
              },
            ),
            ElevatedButton(
              child: const Text('이순신으로', style: TextStyle(fontSize: 24),),
              style: ElevatedButton.styleFrom(
                primary: Colors.greenAccent,
              ),
              onPressed: () {
                myData.change('이순신1', 35);
              },
            ),
            const SizedBox(height: 50,),
            Text(
              '${myData.name} - ${myData.age}',
              style: const TextStyle(fontSize: 30),
            ),
            Consumer<MyData>(
              builder: (context, myData, child) {
                print('Build~~~');
                return Text(
                  '${myData.name} - ${myData.age}', style: const TextStyle(fontSize: 30),
                );
              },
            ),
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
  late MyData myData;

  @override
  Widget build(BuildContext context) {
    myData = Provider.of<MyData>(context, listen: true);

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
            const SizedBox(height: 50,),
            ElevatedButton(
              child: const Text('임꺽정으로', style: TextStyle(fontSize: 24),),
              style: ElevatedButton.styleFrom(
                primary: Colors.greenAccent,
              ),
              onPressed: () {
                myData.change('임꺽정2', 31);
              },
            ),
            ElevatedButton(
              child: const Text('이순신으로', style: TextStyle(fontSize: 24),),
              style: ElevatedButton.styleFrom(
                primary: Colors.greenAccent,
              ),
              onPressed: () {
                myData.change('이순신2', 36);
              },
            ),
            const SizedBox(height: 50,),
            Text(
              '${myData.name} - ${myData.age}',
              style: const TextStyle(fontSize: 30),
            ),
            Consumer<MyData>(
              builder: (context, value, child) {
                return Text('${myData.name} - ${myData.age}', style: const TextStyle(fontSize: 30),);
              },
            ),
          ],
        ),
      ),
    );
  }
}

