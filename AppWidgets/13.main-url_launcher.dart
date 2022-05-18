import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter url_launcher',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter url_launcher'),
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
          children: <Widget>[
            ElevatedButton(
              child: const Text('https', style: TextStyle(fontSize: 24),),
              onPressed: () => _launchURL('https://m.google.com'),
            ),
            SizedBox(height: 10,),
            ElevatedButton(
              child: const Text('tel', style: TextStyle(fontSize: 24),),
              onPressed: () => _launchURL('tel:010-1234-5678'),
            ),
            SizedBox(height: 10,),
            ElevatedButton(
              child: const Text('sms', style: TextStyle(fontSize: 24),),
              onPressed: () {
                if(Platform.isAndroid){
                  _launchURL('sms:010-1234-5678?body=Hello Apple');
                }else if(Platform.isIOS){
                  _launchURL('sms:010-1234-5678');
                }
              },
            ),
            SizedBox(height: 10,),
            ElevatedButton(
              child: const Text('email', style: TextStyle(fontSize: 24),),
              onPressed: () => _sendEmail(),
            ),
            SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }

  void _launchURL(url) async {
    await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
  }

  void _sendEmail() {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'smith@example.com',
      query: encodeQueryParameters(<String, String>{
        'subject': 'Example Subject & Synbols are allowed!',
        'body': 'Example Body & 동해물과 백두산이 ...'
      }),
    );
    _launchURL(emailLaunchUri.toString());
  }

  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries.map((e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}').join('&');
  }
}
