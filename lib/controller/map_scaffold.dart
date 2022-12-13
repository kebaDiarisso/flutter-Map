import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_udemy/controller/detail_controller.dart';
import 'package:flutter_map_udemy/map/custom_marker.dart';
import 'package:flutter_map_udemy/model/remarquable_place.dart';
import 'package:flutter_map_udemy/services/datas_managers.dart';
import 'package:flutter_map_udemy/services/location_manager.dart';
import 'package:flutter_map_udemy/view/app_bar_view.dart';
import 'package:flutter_map_udemy/view/drawer_view.dart';
import 'package:flutter_map_udemy/view/map_view.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

import '../model/map_type.dart';

class MapScaffold extends StatefulWidget {
  //const MapScaffold({super.key});
  Position startPosition;
  MapScaffold({Key? key, required this.startPosition}) : super(key: key);
  @override
  State<MapScaffold> createState() => _MapScaffoldState();
}

class _MapScaffoldState extends State<MapScaffold> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  MapType mapType = MapType.simple;
  MapController mapController = MapController();
  double zoom = 12;
  LatLng center = LatLng(0, 0);
  late StreamSubscription<Position> subscription;
  Stream<Position> listerner = LocationManager().positionListener();
  bool shouldFollow = true;
  Icon get followIcon =>
      Icon((shouldFollow) ? Icons.location_on : Icons.location_off,
          color: Colors.white);

  List<Marker> markers = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    center = LatLng(
      widget.startPosition.latitude,
      widget.startPosition.longitude,
    );
    observePositionChanges();
    getMarkers();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    stopObserving();
    menuPressed();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBarView(
        followIcon: followIcon,
        context: context,
        menuPressed: menuPressed,
        followPositiion: locationTapped,
        zoomIn: zoomIn,
        zoomOut: zoomOut,
      ),
      drawer: DrawerView(
        onDrawerTap: onDrawerTap,
      ),
      body: MapView(
        mapController: mapController,
        mapType: mapType,
        center: center,
        zoom: zoom,
        markers: markers,
        plugins: const [],
        moveToDetail: moveToDetail,
        removeMarker: removeMarker,
      ),
    );
  }

  observePositionChanges() {
    subscription = listerner.listen((newPosition) {
      updatePosition(newPosition);
    });
    //écouter  les map envent
    mapController.mapEventStream.listen((event) {
      if (event is MapEventLongPress) {
        final LatLng tab = event.tapPosition;
        final lat = tab.latitude;
        final lon = tab.longitude;
        final RemarquablePlace newPlace =
            RemarquablePlace(lat: lat, lon: lon, adress: '', city: '');
        final String toBeSave = newPlace.toBeSavedString;
        DatasManager().saveDatas(toBeSave).then((value) => getMarkers());
        //Ajouter aux Shared
      }
      zoom = mapController.zoom;
    });
  }

  getMarkers() async {
    final newMarkers = await DatasManager().getDatas();
    final list = newMarkers.map((e) => CustomMarker(savedString: e)).toList();
    setState(() => markers = list);
  }

  updatePosition(Position position) {
    this.center = LatLng(position.latitude, position.longitude);
    mapController.move(center, zoom);
  }

  stopObserving() {
    subscription.cancel();
  }

  menuPressed() {
    scaffoldKey.currentState?.openDrawer();
  }

  locationTapped() {
    setState(() {
      shouldFollow = !shouldFollow;
      shouldFollow ? observePositionChanges() : stopObserving();
    });
  }

  zoomIn() {
    setState(() {
      zoom = mapController.zoom + 0.5;
      mapController.move(center, zoom);
    });
  }

  zoomOut() {
    setState(() {
      zoom = mapController.zoom - 0.5;
      mapController.move(center, zoom);
    });
  }

  onDrawerTap(MapType mapType) {
    setState(() {
      this.mapType = mapType;
      Navigator.of(context).pop();
    });
  }

  removeMarker(String str) {
    DatasManager().deleteDatas(str).then((_) => getMarkers());
  }

  moveToDetail(RemarquablePlace place) {
    final route =
        MaterialPageRoute(builder: ((ctx) => DetailController(place: place)));
    Navigator.push(context, route);
  }
}
