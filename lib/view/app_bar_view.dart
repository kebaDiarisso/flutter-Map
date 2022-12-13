import 'package:flutter/material.dart';

class AppBarView extends PreferredSize {
  final BuildContext context;
  final Function() menuPressed;
  final Function() followPositiion;
  final Function() zoomOut;
  final Function() zoomIn;
  final Icon followIcon;

  AppBarView(
      {super.key,
      required this.context,
      required this.menuPressed,
      required this.followPositiion,
      required this.zoomOut,
      required this.zoomIn,
      required this.followIcon})
      : super(
            preferredSize: const Size.fromHeight(125),
            child: Container(
              color: Theme.of(context).primaryColorDark,
              child: SafeArea(
                  child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: menuPressed,
                          icon: Icon(Icons.menu),
                          color: Colors.white,
                        ),
                        Text(
                          "Apprendre les cartes",
                          style: TextStyle(
                              color: Colors.white,
                              fontStyle: FontStyle.italic,
                              fontSize: 20),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: followPositiion,
                          icon: followIcon,
                          color: Colors.white,
                        ),
                        IconButton(
                          onPressed: zoomIn,
                          icon: Icon(Icons.zoom_in),
                          color: Colors.white,
                        ),
                        IconButton(
                          onPressed: zoomOut,
                          icon: Icon(Icons.zoom_out),
                          color: Colors.white,
                        ),
                        // FloatingActionButton(
                        //   onPressed: followPositiion,
                        //   child: Icon(Icons.location_on),
                        // )
                      ],
                    ),
                  )
                ],
              )),
            ));
}
