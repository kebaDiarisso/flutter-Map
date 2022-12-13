import 'package:flutter/material.dart';
import 'package:flutter_map_udemy/model/remarquable_place.dart';

class DetailController extends StatelessWidget {
  // const DetailController({super.key});
  final RemarquablePlace place;
  DetailController({required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(place.city),
            Text(place.adress),
            Text("Coords: ${place.lat} / ${place.lon}"),
          ],
        ),
      ),
    );
  }
}
