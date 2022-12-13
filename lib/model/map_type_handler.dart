import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_popup/extension_api.dart' as pop;
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart'
    as cluster;
import 'package:flutter_map_udemy/map/options/marker_cluster_o.dart';
import 'package:flutter_map_udemy/map/widgets/pop_w.dart';
import 'package:flutter_map_udemy/model/remarquable_place.dart';
import '../map/widgets/marker_cluster_w.dart';
import '../map/widgets/marker_layer_w.dart';
import 'map_type.dart';

class MapTypeHandler {
  String titleForType(MapType mapType) {
    switch (mapType) {
      case MapType.simple:
        return "Simple";
      case MapType.annotations:
        return "Markers";
      case MapType.popup:
        return "Pop up";
      case MapType.cluster:
        return "Cluster";
      case MapType.clusterAndPop:
        return "Cluster et Pop-up";
    }
  }

  IconData iconForType(MapType mapType) {
    switch (mapType) {
      case MapType.simple:
        return Icons.map;
      case MapType.annotations:
        return Icons.location_on;
      case MapType.popup:
        return Icons.message;
      case MapType.cluster:
        return Icons.add_circle_sharp;
      case MapType.clusterAndPop:
        return Icons.supervised_user_circle_sharp;
    }
  }

  Widget layerForType(
    MapType mapType,
    List<Marker> markers,
    pop.PopupController popController,
    Function(RemarquablePlace) moveToDetail,
    Function(String) removeMarker,
    cluster.PopupController clusterController,
  ) {
    switch (mapType) {
      case MapType.simple:
        return Container();
      case MapType.annotations:
        return MarkerLayerW(markers: markers);
      case MapType.popup:
        return PopW(
          markers: markers,
          controller: popController,
          removeMarker: removeMarker,
          moveToDetail: moveToDetail,
        );
      case MapType.cluster:
        return MarkerClusterW(
            controller: clusterController,
            markers: markers,
            moveToDetail: moveToDetail,
            removeMarker: removeMarker,
            showPop: false);
      case MapType.clusterAndPop:
        return MarkerClusterW(
            controller: clusterController,
            markers: markers,
            moveToDetail: moveToDetail,
            removeMarker: removeMarker,
            showPop: true);
    }
  }
}
