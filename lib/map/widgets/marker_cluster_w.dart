import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:flutter_map_udemy/map/options/marker_cluster_o.dart';

import 'package:flutter_map_udemy/model/remarquable_place.dart';

class MarkerClusterW extends MarkerClusterLayerWidget {
  MarkerClusterW({
    required PopupController controller,
    required List<Marker> markers,
    required Function(RemarquablePlace) moveToDetail,
    required Function(String) removeMarker,
    required bool showPop,
  }) : super(
            options: MarkerClusterO(
                controller: controller,
                markers: markers,
                moveToDetail: moveToDetail,
                removeMarker: removeMarker));
}
