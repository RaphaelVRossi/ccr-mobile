import 'package:flutter/material.dart';
import 'dart:async';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class MapPage extends StatefulWidget {
  MapPage({Key key, this.title, @required this.latLng}) : super(key: key);

  final String title;

  final LatLng latLng;

  @override
  _MapPageState createState() => _MapPageState(this.latLng);
}

class _MapPageState extends State<MapPage> {
  _MapPageState(this.latLng);

  final LatLng latLng;

  Completer<GoogleMapController> _controller = Completer();

  Position currentLocation;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: SafeArea(
        child: GoogleMap(
          myLocationEnabled: true,
          mapType: MapType.normal,
          trafficEnabled: true,
          initialCameraPosition: CameraPosition(
            target: latLng,
            zoom: 15.0,
          ),
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
      ),
    );
  }
}
