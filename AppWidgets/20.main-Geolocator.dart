import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'dart:io';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Geolocator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Geolocator'),
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
  late Position _currentPosition;
  String _currentAddress = '';
  String lat = '';
  String lon = '';

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
            Text("$lat $lon"),
            Text(_currentAddress),
            SizedBox(height: 10,),
            ElevatedButton(
              child: const Text('Current Location', style: TextStyle(fontSize: 24),),
              onPressed: () {
                _getCurrentLocation();
              },
            ),
            SizedBox(height: 50,),
            ElevatedButton(
              child: const Text('Current Address', style: TextStyle(fontSize: 24),),
              onPressed: () {
                _getAddressFromLatLng();
              },
            ),
          ],
        ),
      ),
    );
  }

  void _getCurrentLocation() {
    Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best, forceAndroidLocationManager: false)
    .then((Position position){
      _currentPosition = position;
      setState(() {
        lat = '${position.latitude}';
        lon = '${position.longitude}';
      });
    }).catchError((e){
      print(e);
    });
  }

  void _getAddressFromLatLng() async {
    try{
      List<Placemark> placemarks = await placemarkFromCoordinates(
        _currentPosition.latitude,
        _currentPosition.longitude
      );
      Placemark place = placemarks[0];
      print(place);

      setState(() {
        if(Platform.isAndroid){
          _currentAddress = "${place.street}";
        }else if(Platform.isIOS){
          _currentAddress = "${place.administrativeArea} ${place.locality} ${place.street}";
        }
      });
    }catch(e){
      print(e);
    }
  }
}
