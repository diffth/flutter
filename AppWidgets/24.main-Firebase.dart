import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Firebase',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Firebase'),
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
  String name = '';

  FirebaseOptions get firebaseOptions => const FirebaseOptions(
    appId: '1:.....:ios:748c9d85566ac54cdbe52b',          // GOOGLE_APP_ID
    apiKey: '...._.....Y3Mniijt9Ec',                      // API_KEY
    projectId: 'flutterex-d77ed',                         // PROJECT_ID
    messagingSenderId: '916500597554',                    // GCM_SENDER_ID
  );

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
              child: const Text('Initialize default app'),
              onPressed: initializeDefault,
            ),
            ElevatedButton(
              child: const Text('Initialize secondary app'),
              onPressed: initializeSecodary,
            ),
            ElevatedButton(
              child: const Text('Get apps'),
              onPressed: apps,
            ),
            ElevatedButton(
              child: const Text('List options'),
              onPressed: options,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> initializeDefault() async {
    FirebaseApp app = await Firebase.initializeApp();
    name = app.name;
    print('Initialized default app $app');
  }

  Future<void> initializeSecodary() async {
    name = 'myFcm';
    FirebaseApp app = await Firebase.initializeApp(
      name: name,
      options: firebaseOptions
    );
    print('Initialized $app');
  }

  void apps() {
    final List<FirebaseApp> apps = Firebase.apps;
    print('Currently initialized apps: $apps');
  }

  void options() {
    final FirebaseApp app = Firebase.app(name);
    final FirebaseOptions? options = app.options;
    print('Current options for app $name: $options');
  }
}
