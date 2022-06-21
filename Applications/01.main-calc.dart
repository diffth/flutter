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
      home: const MyHomePage(title: 'Flutter Calc'),
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
  String _displayText = "0";
  String _tempText = "0";
  String _operText = "";
  List<String> _operatorList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      alignment: Alignment.bottomRight,
                      color: Colors.black,
                      padding: const EdgeInsets.all(10),
                      child: Text(_displayText, style: TextStyle(fontSize: 30, color: Colors.white),),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: AspectRatio(
                    aspectRatio: 1/1,
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(4, 2, 2, 2),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.grey[400]),
                        child: const Text("C", style: TextStyle(fontSize: 24, color: Colors.black),),
                        onPressed: (){
                          _inputNum('clear');
                        },
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: AspectRatio(
                    aspectRatio: 1/1,
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(2, 2, 2, 2),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.grey[400]),
                        child: const Text("+∕−", style: TextStyle(fontSize: 24, color: Colors.black),),
                        onPressed: (){},
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: AspectRatio(
                    aspectRatio: 1/1,
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(2, 2, 2, 2),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.grey[400]),
                        child: const Text("%", style: TextStyle(fontSize: 20, color: Colors.black),),
                        onPressed: (){},
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: AspectRatio(
                    aspectRatio: 1/1,
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(2, 2, 4, 2),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.grey[400]),
                        child: const Text("÷", style: TextStyle(fontSize: 24, color: Colors.black),),
                        onPressed: (){
                          _inputNum('÷');
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: AspectRatio(
                    aspectRatio: 1/1,
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(4, 2, 2, 2),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.grey[300]),
                        child: const Text("7", style: TextStyle(fontSize: 24, color: Colors.black),),
                        onPressed: (){
                          _inputNum('7');
                        },
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: AspectRatio(
                    aspectRatio: 1/1,
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(2, 2, 2, 2),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.grey[300]),
                        child: const Text("8", style: TextStyle(fontSize: 24, color: Colors.black),),
                        onPressed: (){
                          _inputNum('8');
                        },
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: AspectRatio(
                    aspectRatio: 1/1,
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(2, 2, 2, 2),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.grey[300]),
                        child: const Text("9", style: TextStyle(fontSize: 24, color: Colors.black),),
                        onPressed: (){
                          _inputNum('9');
                        },
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: AspectRatio(
                    aspectRatio: 1/1,
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(2, 2, 2, 2),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.grey[400]),
                        child: const Text("×", style: TextStyle(fontSize: 24, color: Colors.black),),
                        onPressed: (){
                          _inputNum('×');
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: AspectRatio(
                    aspectRatio: 1/1,
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(4, 2, 2, 2),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.grey[300]),
                        child: const Text("4", style: TextStyle(fontSize: 24, color: Colors.black),),
                        onPressed: (){
                          _inputNum('4');
                        },
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: AspectRatio(
                    aspectRatio: 1/1,
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(2, 2, 2, 2),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.grey[300]),
                        child: const Text("5", style: TextStyle(fontSize: 24, color: Colors.black),),
                        onPressed: (){
                          _inputNum('5');
                        },
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: AspectRatio(
                    aspectRatio: 1/1,
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(2, 2, 2, 2),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.grey[300]),
                        child: const Text("6", style: TextStyle(fontSize: 24, color: Colors.black),),
                        onPressed: (){
                          _inputNum('6');
                        },
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: AspectRatio(
                    aspectRatio: 1/1,
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(2, 2, 2, 2),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.grey[400]),
                        child: const Text("−", style: TextStyle(fontSize: 24, color: Colors.black),),
                        onPressed: (){
                          _inputNum('−');
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: AspectRatio(
                    aspectRatio: 1/1,
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(4, 2, 2, 2),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.grey[300]),
                        child: const Text("1", style: TextStyle(fontSize: 24, color: Colors.black),),
                        onPressed: (){
                          _inputNum('1');
                        },
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: AspectRatio(
                    aspectRatio: 1/1,
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(2, 2, 2, 2),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.grey[300]),
                        child: const Text("2", style: TextStyle(fontSize: 24, color: Colors.black),),
                        onPressed: (){
                          _inputNum('2');
                        },
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: AspectRatio(
                    aspectRatio: 1/1,
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(2, 2, 2, 2),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.grey[300]),
                        child: const Text("3", style: TextStyle(fontSize: 24, color: Colors.black),),
                        onPressed: (){
                          _inputNum('3');
                        },
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: AspectRatio(
                    aspectRatio: 1/1,
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(2, 2, 2, 2),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.grey[400]),
                        child: const Text("+", style: TextStyle(fontSize: 24, color: Colors.black),),
                        onPressed: (){
                          _inputNum('+');
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: AspectRatio(
                    aspectRatio: 2/1,
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(4, 2, 2, 2),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.grey[300]),
                        child: const Text("0", style: TextStyle(fontSize: 24, color: Colors.black),),
                        onPressed: (){
                          _inputNum('0');
                        },
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: AspectRatio(
                    aspectRatio: 1/1,
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(2, 2, 2, 2),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.grey[300]),
                        child: const Text(".", style: TextStyle(fontSize: 24, color: Colors.black),),
                        onPressed: (){
                          _inputNum('.');
                        },
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: AspectRatio(
                    aspectRatio: 1/1,
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(2, 2, 4, 2),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.orange),
                        child: const Text("=", style: TextStyle(fontSize: 24, color: Colors.black),),
                        onPressed: (){
                          _calculate();
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  
  void _inputNum(String num) {
    setState(() {
      if(num == 'clear'){
        _displayText = "0";
        _tempText = "0";
        _operatorList.clear();
        return;
      }
      if(_tempText == "0"){
        _tempText = '';
        _tempText += num;
        _displayText = '';
        _displayText += num;
      }else{
        if(num == '+' || num == '−' || num == '×' || num == '÷'){
          if(_operText == ''){
            _operatorList.add(_tempText);
            _tempText = "";
            _operatorList.add(num);
            _displayText += num;
          }else{
            _operatorList.removeAt(_operatorList.length - 1);
            _operatorList.add(num);
            _displayText = _displayText.substring(0, _displayText.length - 1) + num;
          }
          _operText = num;
        }else{
          _tempText += num;
          _operText = "";
          _displayText += num;
        }
      }
    });
  }
  
  void _calculate() {
    if(_operText == ""){
      _operatorList.add(_tempText);
    }else{
      _operatorList.removeAt(_operatorList.length - 1);
    }
    String result = _calculation();
    _operatorList.clear();
    _tempText = "0";
    _operText = "";

    setState(() {
      _displayText = result;
    });
  }
  // if(num == '+' || num == '−' || num == '×' || num == '÷'){
  String _calculation() {
    double prev = 0;
    double curt = 0;
    String mode = "";

    for(int i=0; i<_operatorList.length; i++){
      String s = _operatorList[i];

      if(s == "+"){
        mode = "";
      }else if(s == "−"){
        mode = "";
      }else if(s == "×"){
        mode = "mul";
      }else if(s == "÷"){
        mode = "div";
      }else{
        if(mode == "mul" || mode == "div" && s != "+" && s != "−" && s != "×" && s != "÷"){
          double one = double.parse(_operatorList[i-2]);
          double two = double.parse(_operatorList[i]);
          double result = 0.0;

          if(mode == "mul"){
            result = one * two;
          }else if(mode == "div"){
            result = one / two;
          }
          _operatorList.insert(i+1, result.toString());

          for(int j=0; j<3; j++){
            _operatorList.removeAt(i - 2);
          }
          i -= 2;
        }
      }
    }

    for(String s in _operatorList){
      if(s == "+"){
        mode = "add";
      }else if(s == "−"){
        mode = "sub";
      }else{
        curt = double.parse(s);
        if(mode == 'add'){
          prev += curt;
        }else if(mode == "sub"){
          prev -= curt;
        }else{
          prev = curt;
        }
      }
    }
    return prev.toString();
  }
}
