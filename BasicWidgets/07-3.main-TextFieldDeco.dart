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
  int _count = 0;
  String _myText = 'TextField 사용 예제입니다.';
  final ctlMyText1 = TextEditingController();
  final ctlMyText2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              _myText,
              style: const TextStyle(fontSize: 30.0),
            ),
            const SizedBox(height: 20,),
            TextField(
              controller: ctlMyText1,
            ),
            const SizedBox(height: 20,),
            Text(
              '$_count / 10',
              style: const TextStyle(
                fontSize: 30.0,
                color: Colors.red,
              ),
            ),
            SizedBox(
              width: 240,
              child: TextField(
                controller: ctlMyText2,
                maxLength: 10,
                obscureText: true,
                enabled: true,
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.greenAccent, width: 1.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 1.0),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                  ),
                  prefixIcon: Icon(Icons.perm_identity),
                  labelText: 'Password',
                  counterStyle: TextStyle(
                    fontSize: 30.0,
                    color: Colors.red,
                  ),
                ),
                onChanged: (text){
                  setState(() {
                    _count = text.length;
                  });
                  print('$text - $text');
                },
                onSubmitted: (text){
                  print('Submitted : $text');
                },
              ),
            ),
            OutlinedButton(
              child: const Text('OutlinedButton', style: TextStyle(fontSize: 24),),
              onPressed: () {
                setState(() {
                  _myText = ctlMyText1.text;
                });
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _myText = ctlMyText2.text;
          });
        },
        tooltip: 'TextField Submit',
        child: const Icon(Icons.send),
      ),
    );
  }
}
