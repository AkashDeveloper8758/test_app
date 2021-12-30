import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final Completer<GoogleMapController> _controller = Completer();

  static const LatLng _center = LatLng(12.9610, 77.6387);
  late Set<Marker> _markers = {};
  @override
  void initState() {
    _markers = {
      const Marker(
        markerId: MarkerId('marker1'),
        position: LatLng(12.962938, 77.632852),
      ),
      const Marker(
        markerId: MarkerId('marker2'),
        position: LatLng(12.968165, 77.631801),
      ),
      const Marker(
        markerId: MarkerId('marker3'),
        position: LatLng(12.964897, 77.633897),
      ),
      const Marker(
        markerId: MarkerId('marker4'),
        position: LatLng(12.966897, 77.633897),
      ),
    };
    super.initState();
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: GoogleMap(
        markers: _markers,
        onMapCreated: _onMapCreated,
        initialCameraPosition: const CameraPosition(
          target: _center,
          zoom: 15.0,
        ),
      ),
    );
  }
}
