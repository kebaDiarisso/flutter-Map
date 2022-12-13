import 'package:flutter_map_udemy/model/remarquable_place.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

class PopUpCard extends StatefulWidget {
  RemarquablePlace place;
  final Function(String) removeMarker;
  final Function(RemarquablePlace) moveToDetail;

  PopUpCard(
      {required this.place,
      required this.moveToDetail,
      required this.removeMarker});

  @override
  CardState createState() => CardState();
}

class CardState extends State<PopUpCard> {
  // final coder = GeocodingPlatform.instance;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Card(
        color: Theme.of(context).primaryColorLight,
        elevation: 5,
        child: Column(
          children: [
            Text(
              widget.place.city,
              style: TextStyle(color: Colors.red, fontSize: 16),
            ),
            Text(
              widget.place.adress,
              style: TextStyle(color: Colors.white, fontSize: 13),
            ),
            Row(
              children: [
                IconButton(
                    onPressed: (() =>
                        widget.removeMarker(widget.place.toBeSavedString)),
                    icon: Icon(Icons.delete)),
                IconButton(
                    onPressed: (() => widget.moveToDetail(widget.place)),
                    icon: Icon(Icons.search)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
