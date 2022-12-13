import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:flutter_map_udemy/model/remarquable_place.dart';
import 'package:flutter_map_udemy/services/location_manager.dart';
import 'package:flutter_map_udemy/view/pop_up_card.dart';

class MarkerClusterO extends MarkerClusterLayerOptions {
  final PopupController controller;
  final List<Marker> markers;
  final bool showPop;
  Function(RemarquablePlace) moveToDetail;
  Function(String) removeMarker;

  MarkerClusterO(
      {required this.controller,
      required this.markers,
      this.showPop = false,
      required this.moveToDetail,
      required this.removeMarker})
      : super(
            maxClusterRadius: 200,
            disableClusteringAtZoom: 15,
            size: Size(50, 50),
            fitBoundsOptions: FitBoundsOptions(padding: EdgeInsets.all(30)),
            markers: markers,
            polygonOptions: PolygonOptions(
              borderColor: Colors.lightGreenAccent,
              color: Colors.limeAccent.withOpacity(0.2),
              borderStrokeWidth: 2,
            ),
            popupOptions: (!showPop)
                ? null
                : PopupOptions(popupBuilder: (context, marker) {
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
                  }),
            builder: (context, markers) {
              return Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    shape: BoxShape.circle),
                child: Text(
                  markers.length.toString(),
                  style: TextStyle(color: Colors.white),
                ),
              );
            });
}
