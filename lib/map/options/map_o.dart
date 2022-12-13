import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapO extends MapOptions {
  @override
  final LatLng center;
  final double zoom;
  final List<MapPlugin> plugins;

  MapO({required this.center, required this.zoom, required this.plugins})
      : super(center: center, zoom: zoom, maxZoom: 16, plugins: []);
}
