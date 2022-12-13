import 'package:flutter/material.dart';
import 'package:flutter_map_udemy/model/map_type_handler.dart';
import '../model/map_type.dart';

class DrawerTile extends StatelessWidget {
  // const DrawerTile({super.key});
  final MapType mapType;
  final Function(MapType) onTap;

  const DrawerTile({required this.mapType, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(MapTypeHandler().titleForType(mapType)),
      leading: Icon(MapTypeHandler().iconForType(mapType)),
      onTap: (() => onTap(mapType)),
    );
  }
}
