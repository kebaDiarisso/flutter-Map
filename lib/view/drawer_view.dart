import 'package:flutter/material.dart';
import 'package:flutter_map_udemy/view/drawer_header.dart';
import 'package:flutter_map_udemy/view/drawer_tile.dart';

import '../model/map_type.dart';

class DrawerView extends StatelessWidget {
  //const DrawerView({super.key});

  late final Function(MapType) onDrawerTap;

  DrawerView({required this.onDrawerTap});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        Column(
          children: drawerList(),
        )
      ]),
    );
  }

  List<Widget> drawerList() {
    List<Widget> list = [const CustomDrawerHeader()];
    list.addAll(MapType.values
        .map((mapType) => DrawerTile(mapType: mapType, onTap: onDrawerTap))
        .toList());
    return list;
  }
}
