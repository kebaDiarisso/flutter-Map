import 'package:flutter_map/flutter_map.dart';

import '../options/tile_layer_o.dart';

class TileLayerW extends TileLayerWidget {
  final TileLayerO tileOptions;
  TileLayerW({super.key, required this.tileOptions})
      : super(options: tileOptions);
}
