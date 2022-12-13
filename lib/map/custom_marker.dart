import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter/material.dart';

class CustomMarker extends Marker {
  // const CustomMarker({super.key});
  String savedString;

  CustomMarker({required this.savedString})
      : super(
            point: LatLng(double.parse(savedString.split("&")[0]),
                double.parse(savedString.split("&")[1])),
            builder: (context) {
              return const Icon(
                Icons.location_city,
                color: Colors.teal,
                size: 18,
              );
            });
}
