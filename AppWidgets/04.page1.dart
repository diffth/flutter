import 'package:flutter/material.dart';
import 'page2.dart';
import 'page3.dart';

class Page1 extends StatefulWidget {
  String data = '';

  Page1({ Key? key, required this.data }) : super(key: key);

  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 1'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('2페이지 추가', style: TextStyle(fontSize: 24),),
              onPressed: () async{
                setState(() {
                  widget.data = '';
                });
                String value = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Page2(
                      data: '1페이지에서 보냄(1->2)',
                    ),
                  ),
                );
                print('result(1-1) : $value');
                setState(() {
                  widget.data = value;
                });
              },
            ),
            const SizedBox(height: 20,),
            ElevatedButton(
              child: const Text('3페이지 추가', style: TextStyle(fontSize: 24),),
              onPressed: () async{
                setState(() {
                  widget.data = '';
                });

                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Page3(
                      data: '1페이지에서 보냄(1->3)', 
                    ),
                  ),
                ).then((value){
                  print('result(1-2) : $value');
                  setState(() {
                    widget.data = value;
                  });
                });
              },
            ),
            Text(widget.data, style: const TextStyle(fontSize: 30),),
          ],
        ),
      ),
    );
  }
}
