import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_popup/flutter_map_marker_popup.dart';
import 'package:flutter_map_udemy/model/remarquable_place.dart';
import 'package:flutter_map_udemy/view/pop_up_card.dart';

import '../../services/location_manager.dart';

class PopO extends PopupMarkerLayerOptions {
  PopO(
      {required List<Marker> markers,
      required PopupController controller,
      required Function(RemarquablePlace) moveToDetail,
      required Function(String) removeMarker})
      : super(
            popupController: controller,
            markers: markers,
            popupBuilder: (context, marker) {
              return FutureBuilder<RemarquablePlace>(
                  future: LocationManager().getAdress(marker),
                  builder: ((context, snap) {
                    return (snap.hasData)
                        ? PopUpCard(
                            place: snap.data!,
                            moveToDetail: moveToDetail,
                            removeMarker: removeMarker)
                        : CircularProgressIndicator();
                  }));
            });
}
