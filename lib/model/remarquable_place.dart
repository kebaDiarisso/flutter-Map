import 'package:latlong2/latlong.dart';

class RemarquablePlace {
  double lat;
  double lon;
  String city;
  String adress;

  // String get city => _city ?? "";
  // String get adress => _adress ?? "";
  String get toBeSavedString => "$lat&$lon";
  LatLng get center => LatLng(lat, lon);

  // setCity(String c) => _city = c;
  // setAdress(String a) => _adress = a;

  RemarquablePlace(
      {required this.lat,
      required this.lon,
      required this.city,
      required this.adress});
}
