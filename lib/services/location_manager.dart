import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_udemy/model/remarquable_place.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationManager {
  final coder = GeocodingPlatform.instance;

  Future<Position> start() async {
    final bool locationEnabled = await Geolocator.isLocationServiceEnabled();
    return (locationEnabled)
        ? await handlePermission()
        : await errorString("Location désactivée");
  }

  Future<Position> handlePermission() async {
    final LocationPermission locationPermission =
        await Geolocator.checkPermission();
    return await resultPermission(locationPermission);
  }

  Future<Position> resultPermission(
      LocationPermission locationPermission) async {
    switch (locationPermission) {
      case LocationPermission.deniedForever:
        return errorString("Permission Refusée");
      case LocationPermission.denied:
        return request()
            .then((newPermission) => resultPermission((newPermission)));
      case LocationPermission.unableToDetermine:
        return request()
            .then((newPermission) => resultPermission((newPermission)));
      case LocationPermission.whileInUse:
        return await getPosition();
      case LocationPermission.always:
        return await getPosition();
    }
  }

  Future<Position> getPosition() async =>
      await Geolocator.getCurrentPosition(); //returner la position

  Future<LocationPermission> request() async =>
      await Geolocator.requestPermission();
  Future<Position> errorString(String err) async => await Future.error(err);

  //observer les changements de position
  Stream<Position> positionListener() {
    const accuracy = LocationAccuracy.high;
    const distance = 10;
    const LocationSettings locationSettings =
        LocationSettings(accuracy: accuracy, distanceFilter: distance);
    return Geolocator.getPositionStream(locationSettings: locationSettings);
  }

  Future<RemarquablePlace> getAdress(Marker marker) async {
    final places = await coder.placemarkFromCoordinates(
        marker.point.latitude, marker.point.longitude);

    if (places.isNotEmpty) {
      final firstPlace = places.first;
      return RemarquablePlace(
          lat: marker.point.latitude,
          lon: marker.point.longitude,
          city: places.first.locality ?? "",
          adress: places.first.street ?? "");
    } else {
      return RemarquablePlace(
          lat: marker.point.latitude,
          lon: marker.point.longitude,
          city: "",
          adress: "");
    }
  }
}
