import 'package:flutter/material.dart';
import 'page3.dart';

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
            const SizedBox(height: 20,),
            ElevatedButton(
              child: const Text('3페이지로 변경', style: TextStyle(fontSize: 24),),
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, anim1, anim2) => Page3(
                      data: '2페이지에서 보냄(Replacement)',
                    ),
                    transitionDuration: const Duration(seconds: 0),
                  ),
                );
              },
            ),
            Text(widget.data, style: const TextStyle(fontSize: 30),),
          ],
        ),
      ),
    );
  }
}
