import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  //Completer<GoogleMapController> _controller = Completer();
  GoogleMapController mapController;

  //static const LatLng _center = const LatLng(45.521563, -122.677433);
  static const LatLng _center = const LatLng(34.994183, 25.226157);

  final Set<Marker> _markers = {};

  //LatLng _lastMapPosition = _center;

  MapType _currentMapType = MapType.satellite;

  void _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal ? MapType.satellite : MapType.normal;
    });
  }

  // void _onAddMarkerButtonPressed() {
  //   setState(() {
  //     _markers.add(Marker(
  //       // This marker id can be anything that uniquely identifies each marker.
  //       markerId: MarkerId(_lastMapPosition.toString()),
  //       position: _lastMapPosition,
  //       infoWindow: InfoWindow(
  //         title: 'Really cool place',
  //         snippet: '5 Star Rating',
  //       ),
  //       icon: BitmapDescriptor.defaultMarker,
  //     ));
  //   });
  // }

  // void _onCameraMove(CameraPosition position) {
  //   _lastMapPosition = position.target;
  // }

  // void _onMapCreated(GoogleMapController controller) {
  //   _controller.complete(controller);
  // }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child:  Scaffold(
          appBar: AppBar(
            title: Text('Location'),
            leading: IconButton(
            icon: Image.asset('images/cmbt.png'), 
            onPressed: () { },
          ),
          ),
          body:Container(
      // color: Colors.blueGrey,
      child: Column(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: 250.0,
                    height: 250.0,
                    margin: EdgeInsets.only(top: 20.0),
                    child: GoogleMap(
                      onMapCreated: _onMapCreated,
                      initialCameraPosition: CameraPosition(
                        target: _center,
                        zoom: 11.0,
                      ),
                      markers: {
                        Marker(
                          markerId: MarkerId("cmbt_office"),
                          position: _center,
                          infoWindow: InfoWindow(
                            title: 'Cmbt Office',
                            snippet: 'Ahedrias',
                          ),
                          icon: BitmapDescriptor.defaultMarker,
                        )
                      },
                    ),
                  ),
                  
                ],
              ),
            ),
          ),
        ],
      ),
          ),
      ),
    );
  }
}

