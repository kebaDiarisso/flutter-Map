import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_popup/flutter_map_marker_popup.dart';
import 'package:flutter_map_udemy/model/remarquable_place.dart';

import '../options/pop_o.dart';

class PopW extends PopupMarkerLayerWidget {
  PopW(
      {required List<Marker> markers,
      required PopupController controller,
      required Function(RemarquablePlace) moveToDetail,
      required Function(String) removeMarker})
      : super(
            options: PopO(
                markers: markers,
                controller: controller,
                removeMarker: removeMarker,
                moveToDetail: moveToDetail));
}
