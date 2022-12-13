import 'package:flutter/cupertino.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:flutter_map_marker_popup/extension_api.dart' as pop;
import 'package:flutter_map_udemy/map/options/map_o.dart';
import 'package:flutter_map_udemy/map/options/tile_layer_o.dart';
import 'package:flutter_map_udemy/model/map_type_handler.dart';
import 'package:flutter_map_udemy/model/remarquable_place.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart'
    as cluster;
import '../map/widgets/tile_layer_w.dart';
import '../model/map_type.dart';

class MapView extends StatelessWidget {
  // const MapView({super.key});

  final LatLng center;
  final double zoom;
  final List<MapPlugin> plugins;
  final MapController mapController;
  final MapType mapType;
  final List<Marker> markers;
  pop.PopupController popController = pop.PopupController();
  Function(RemarquablePlace) moveToDetail;
  Function(String) removeMarker;
  cluster.PopupController clusterController = cluster.PopupController();

  MapView({
    Key? key,
    required this.center,
    required this.zoom,
    required this.plugins,
    required this.mapController,
    required this.mapType,
    required this.markers,
    required this.moveToDetail,
    required this.removeMarker,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: mapController,
      options: MapO(center: center, zoom: zoom, plugins: plugins),
      children: [
        TileLayerW(tileOptions: TileLayerO()),
        LocationMarkerLayerWidget(),
        MapTypeHandler().layerForType(mapType, markers, popController,
            moveToDetail, removeMarker, clusterController)
      ],
    );
  }
}
