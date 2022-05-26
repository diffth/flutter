import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter GoogleMaps',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter GoogleMaps'),
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
  Completer<GoogleMapController> _controller = Completer();
  LatLng _myLoc = LatLng(0, 0);
  String lat = '';
  String lon = '';
  List<Marker> _markers = [];
  Random _random = new Random();
  late BitmapDescriptor customMarker;

  @override
  void initState() {
    super.initState();
    setCustomMaker().then((value){
      getCurrentLocation();
    });
  
  }
  Future<void> setCustomMaker() async {
    customMarker = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(size: Size(48, 48)), 'assets/images/marker4.png'
    );
  }

  void getCurrentLocation() {
    Geolocator.getPositionStream(distanceFilter: 10).listen((Position position) async {
      lat = '${position.latitude}';
      lon = '${position.longitude}';
      _myLoc = LatLng(position.latitude, position.longitude);

      final GoogleMapController controller = await _controller.future;
      controller.moveCamera(CameraUpdate.newCameraPosition(CameraPosition(target: _myLoc, zoom: 17)));
      markerAdd();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              height: 400,
              child: GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: CameraPosition(
                  target: LatLng(0, 0),
                  zoom: 17.0,
                ),
                onMapCreated: (GoogleMapController controller){
                  _controller.complete(controller);
                },
                markers: Set.from(_markers),
              ),
            ),
            Text("$lat $lon"),
          ],
        ),
      ),
    );
  }

  void markerAdd() {
    final marker = Marker(
      markerId: MarkerId('marker'),
      position: _myLoc,
      icon: customMarker,
      onTap: () => callSanckBar("Hello World~!"),
    );
    setState(() {
      _markers.clear();
      _markers.add(marker);
    });
  }

  callSanckBar(String msg) {
    int myRandomCount = _random.nextInt(5);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Container(
          height: 60,
          child: Row(
            children: [
              Image.asset('assets/images/marker3.png', width: 60,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(msg, style: TextStyle(color: Colors.black),),
                  Row(
                    children: [
                      IconTheme(
                        data: IconThemeData(color: Colors.red,),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(5, (index){
                            return Icon(index < myRandomCount ? Icons.star : Icons.star_border);
                          }),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        backgroundColor: Colors.yellow[800],
        duration: Duration(milliseconds: 60000),
        action: SnackBarAction(
          label: 'Undo',
          textColor: Colors.black,
          onPressed: () {
            
          },
        ),
      ),
    );
  }
}
