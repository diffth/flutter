import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter http',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter http'),
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
            ElevatedButton(
              child: const Text('Http (GET)', style: TextStyle(fontSize: 24,)),
              onPressed: () {
                _getRequest();
              },
            ),
            ElevatedButton(
              child: const Text('Http (POST)', style: TextStyle(fontSize: 24),),
              onPressed: () {
                _postRequest();
              },
            ),
          ],
        ),
      ),
    );
  }

  void _getRequest() async {
    var url = Uri.parse("http://sample.bmaster.kro.kr/contacts/1592030163198");
    http.Response response = await http.get(
      url,
      headers: {"Accept":"application/json"}
    );
    var statusCode = response.statusCode;
    var responseBody = utf8.decode(response.bodyBytes);

    print("statusCode: $statusCode");
    print("responseBody: $responseBody");
  }

  void _postRequest() async {
    var url = Uri.parse('http://sample.bmaster.kro.kr/contacts');
    http.Response response = await http.post(
      url,
      headers: {
        'Content-Type':'application/x-www-form-urlencoded',
      },
      body: {
        "name":"장그래",
        "tel":"010-1111-2222",
        "address":"서울시 종로구",
      },
    );
    var statusCode = response.statusCode;
    var responseBody = utf8.decode(response.bodyBytes);

    print("statusCode: $statusCode");
    print("responseBody: $responseBody");
  }
}
