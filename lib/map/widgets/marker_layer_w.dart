import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_udemy/map/options/marker_layer_o.dart';

class MarkerLayerW extends MarkerLayerWidget {
  MarkerLayerW({required List<Marker> markers})
      : super(options: MarkerLayerO(markers: markers));
}
