import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

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
  LatLng _myLoc1 = LatLng(37.57979551550774, 126.97706246296076);   // 경복궁
  LatLng _myLoc2 = LatLng(37.578932311976125, 126.99489126244981);  // 창경궁
  List<Marker> _markers = [];

  @override
  void initState() {
    super.initState();
    setMarkerData();
  }

  void setMarkerData() {
    final marker1 = Marker(
      markerId: MarkerId('A01'),
      position: _myLoc1,
      infoWindow: InfoWindow(
        title: "경복궁",
        snippet: "여기는 경복궁입니다.",
        onTap: () {
          print('AAA');
        },
      ),
    );
    _markers.add(marker1);
    final marker2 = Marker(
      markerId: MarkerId('A02'),
      position: _myLoc2,
      infoWindow: InfoWindow(
        title: "창경궁",
        snippet: "여기는 창경궁입니다.",
        onTap: () {
          print('BBB');
        },
      ),
    );
    _markers.add(marker2);
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
                initialCameraPosition: CameraPosition(target: _myLoc1, zoom: 15.0),
                markers: Set.from(_markers),
                onMapCreated: (GoogleMapController controller){
                  _controller.complete(controller);
                },
              ),
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: const Text('경복궁 이동', style: TextStyle(fontSize: 24),),
                  onPressed: () => goToLocation(_myLoc1),
                ),
                SizedBox(width: 10,),
                ElevatedButton(
                  child: const Text('창경궁 이동', style: TextStyle(fontSize: 24),),
                  onPressed: () => goToLocation(_myLoc2),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> goToLocation(LatLng loc) async {
    final GoogleMapController controller = await _controller.future;

    final CameraPosition pos = CameraPosition(
      target: loc,
      zoom: 15,
    );
    controller.animateCamera(CameraUpdate.newCameraPosition(pos));
  }

}
