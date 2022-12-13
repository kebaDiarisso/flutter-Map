import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';

import '../services/location_manager.dart';
import 'map_scaffold.dart';
import 'no_data_controllrt.dart';

class HomeController extends StatelessWidget {
  const HomeController({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Position>(
        future: LocationManager().start(),
        builder: ((context, position) => (position.hasData)
            ? MapScaffold(startPosition: position.data!)
            : const NoDataController()));
  }
}
