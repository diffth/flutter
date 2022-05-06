import 'package:flutter/material.dart';

class Page2 extends StatefulWidget {
  String data = '';

  Page2({ Key? key, required this.data }) : super(key: key);

  @override
  _Page2State createState() => _Page2State();
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
              child: const Text('2페이지 제거', style: TextStyle(fontSize: 24),),
              onPressed: (){
                Navigator.pop(context, '2페이지에서 보냄(pop)');
              },
            ),
            Text(widget.data, style: const TextStyle(fontSize: 30),)
          ],
        ),
      ),
    );
  }
}
