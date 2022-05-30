import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

late FirebaseApp fbApp;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  fbApp = await Firebase.initializeApp();
  print('Initialized default app $fbApp');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Firestore',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Firestore'),
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
  late CollectionReference members;
  int seqNum = 0;
  final ctlMyText1 = TextEditingController();

  @override
  void initState() {
    super.initState();
    members = FirebaseFirestore.instance.collection('members');
  }

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
              child: const Text('Member Info Insert', style: TextStyle(fontSize: 24),),
              onPressed: () => doInsert(),
            ),
            SizedBox(
              width: 240,
              child: TextField(controller: ctlMyText1,),
            ),
            const SizedBox(height: 10,),
            ElevatedButton(
              child: const Text('Member Info Select', style: TextStyle(fontSize: 24),),
              onPressed: () => doSelectOne(),
            ),
            ElevatedButton(
              child: const Text('Member Info Update', style: TextStyle(fontSize: 24),),
              onPressed: () => doUpdate(),
            ),
            ElevatedButton(
              child: const Text('Member Info Delete', style: TextStyle(fontSize: 24),),
              onPressed: () => doDelete(),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> doInsert() async {
    String sNum = ctlMyText1.text;
    int nNum = int.parse(sNum);
    String sId = 'member$nNum';

    var documentSnapshot = await members.doc(sId).get();
    if(documentSnapshot != null){
      members.doc(sId).set({
        'pw':'1234',
        'email':'test1@test.com',
      });
    }else{
      print('Member Info already exists.');
    }
  }

  void doSelectOne() async {
    String sNum = ctlMyText1.text;
    int nNum = int.parse(sNum);
    String sId = 'member$nNum';

    var documentSnapshot = await members.doc(sId).get();
    if(documentSnapshot != null){
      String pw = documentSnapshot.get('pw');
      String email = documentSnapshot.get('email');

    }else{
      print('Member Info Not exist.');
    }
  }

  Future<void> doUpdate() async {
    String sNum = ctlMyText1.text;
    int nNum = int.parse(sNum);
    String sId = 'member$nNum';

    var documentSnapshot = await members.doc(sId).get();
    if(documentSnapshot != null){
      members.doc(sId).update({
        'email':'xxx@test.com',
      });
    }else{
      print('Member Info Not exist.');
    }
  }

  Future<void> doDelete() async {
    String sNum = ctlMyText1.text;
    int nNum = int.parse(sNum);
    String sId = 'member$nNum';

    var documentSnapshot = await members.doc(sId).get();
    if(documentSnapshot != null){
      var documentReference = await members.doc(sId);
      documentReference.delete();
    }else{
      print('Member Info Not exist.');
    }
  }
}

