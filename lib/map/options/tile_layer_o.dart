import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';

class TileLayerO extends TileLayerOptions {
  TileLayerO()
      : super(
          urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
          subdomains: ['a', 'b', 'c'],
          attributionBuilder: (context) =>
              const Text("© OpenStreetMap contributors"),
        );
}
