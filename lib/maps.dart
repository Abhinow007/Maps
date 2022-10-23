import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class Maps extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final latitude;
  // ignore: prefer_typing_uninitialized_variables
  final longitude;

  const Maps(this.latitude, this.longitude, {super.key});
  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FlutterMap(
          options: MapOptions(
            center: LatLng(widget.latitude, widget.longitude),
            zoom: 16.5,
          ),
          nonRotatedChildren: [
            AttributionWidget.defaultWidget(
              source: 'OpenStreetMap contributors',
              onSourceTapped: null,
            ),
          ],
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.example.app',
            ),
            MarkerLayer(
              markers: [
                Marker(
                  point: LatLng(widget.latitude, widget.longitude),
                  width: 50,
                  height: 50,
                  builder: (context) => const FlutterLogo(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
