import 'package:flutter/material.dart';
import 'package:google_maps/main.dart';
import 'package:map_view/map_view.dart';
import 'package:map_view/polygon.dart';
import 'package:map_view/figure_joint_type.dart';
import 'package:map_view/location.dart';
import 'package:map_view/locations.dart';

var myKey = "AIzaSyARFUvXea4QVJiI-On87ikYFZeTrNPtNpU";
void main() {
  MapView.setApiKey(myKey); 
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  MapView mapView = new MapView();
  List<Marker> markers = [
    new Marker("1", "Mabs Tech", 24.871940, 66.988060),
    new Marker("2", "PAF KIET", 24.928929, 67.040402),
    new Marker("3","Home",24.940555, 67.076778)
  ];

  List<Polygon> polygons = [
    new Polygon("Route", 
    <Location> [
      new Location(24.871940, 66.988060),
      new Location( 24.928929, 67.040402),
      new Location(24.940555, 67.076778)

    ],
    jointType: FigureJointType.round,
    strokeColor: Colors.blue,
    fillColor: Colors.blue.withOpacity(0.1),
    strokeWidth: 10.0,


    )
  ];
  
  displayMap(){
    mapView.show(
        MapOptions(
          mapViewType: MapViewType.normal,
          initialCameraPosition: CameraPosition(new Location(24.871940, 66.988060), 15.0),
          showUserLocation: false,
          title: 'Google Map'

        )
    );
    mapView.onMapTapped.listen((onData){
      mapView.setMarkers(markers);
      mapView.setPolygons(polygons);
      mapView.zoomToFit(padding: 100);
      
    });
  }

  @override
  Widget build(BuildContext context) {
   
    return new Scaffold(
      appBar: new AppBar(
        
        title: new Text('Google Maps Practice'),
      ),
      body:new Center(
       child :new Container(
        
        child: new RaisedButton(
          
          child: Text('Tap Me'),
          color: Colors.blue,
          textColor: Colors.white,
          elevation: 0.7,
          onPressed: displayMap,
        ),
      )),
    );
  }
}
